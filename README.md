# Kill Angular Server

This simple swift script fetches the current pid for the process started by `ng serve` and kills `t.

## Set-up

Simply add the script any directory you want (I put it in `~/bin`). Whenever you are working with an angular application, open a secodary terminal at the specified path.
You can call the script either using `swift killng.swift` or using `./killng.swift`.

## Other

There are ways of making scripts available globally, but since you have to open a secondary terminal anyway, I just keep it in this location, and call it from there.

## LICENSE

This project under the [MIT License](LICENSE.md).
