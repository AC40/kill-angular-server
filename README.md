# Kill Angular Server

This simple swift script fetches the current pid for the process started by `ng serve` and kills it.

---

## Set-up

Simply add the script any directory you want (I put it in `~/bin`). Whenever you are working with an angular application, open a secodary terminal at the specified path.
There are two ways of calling this script:

1. Execute the command `swift killng.swift``
2. Execute the command `./killng.swift`
   <br>For this command, you might need to to a one-time set-up. Execute the command `chmod u+x killng.swift`, to allow the user to execute this script.

## Other

There are ways of making scripts available globally, but since you have to open a secondary terminal anyway, I just keep it in this location, and call it from there.

## LICENSE

This project under the [MIT License](LICENSE.md).
