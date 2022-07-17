#! /usr/bin/env swift
import Foundation

//MARK: Main logic
var output = shell("ps -ef | grep \"ng serve\"")
//print("Output when gotten:\n\(output)")

var firstRgx = #"\s*\d*\s*\d*\s*\d*\s*\d\s*\d:\d*PM ttys\d*\s*\d*:\d*.\d*\s*\/bin\/zsh\s-c\sps\s-ef\s\|\sgrep\s"ng\sserve"\s*\d*\s*\d*\s\d*\s*\d\s*\d:\d*PM ttys\d*\s*\d*:\d*.\d*\sgrep\sng\sserve\s*\d*\s"#

var secondRgx = #"\s\d*\s*\d\s*\d:\d*PM ttys\d*\s*\d:\d*.\d* ng serve\s*"#

output = output.replacingOccurrences(of: firstRgx, with: "", options: [.regularExpression])
output = output.replacingOccurrences(of: secondRgx, with: "", options: [.regularExpression])

//print("Output after replacement:\n\(output)")
guard let pid = Int(output) else {
    print("Error extracting pid from string")
    exit(1)
}

_ = shell("kill \(pid)")


//MARK Utility
func shell(_ command: String) -> String {
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-c", command]
    task.launchPath = "/bin/zsh"
    task.standardInput = nil
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)!
    
    return output
}
