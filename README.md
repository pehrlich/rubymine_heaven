# RubyMine Heaven

This gem does 2 things:

* connects stack trace on rails error page to rubymine (when you click on stack trace line in browser, RubyMine will open appropriate file on the line which caused the error
* in similar manner it connects links from footnotes (if present) to RubyMine (https://github.com/josevalim/rails-footnotes)

## Getting started

You need to perform some steps (one time) before first usage:

* Create command line launcher for RubyMine (Tools / Create Command-line launcher for RubyMine 4 EAP)
* Create protocol handler in AppleScript Editor
    * start the AppleScript Editor
    * paste this code into the editor:
    <blockquote>
    <p>on open location this_url</p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;do shell script ("mine_handler '" & this_url & "'")</p>
    <p>end open location</p>
    </blockquote>
    * save this file as an Application (for instance to /Applicaions folder)
* link protocol "x-mine" to application created in previous step (You can use MisFox, MoreInternet or RCDefaultApp for it)
    * in MisFox select Protocol Helpers and add new protocol with name "x-mine" a chose application created in
    AppleScript editor as it's handler.




## Usage

In your Gemfile add:

  <code>gem 'rubymine_heaven'<code>

that's all...

## Prerequisites

* Mac OS X
* IntelliJ RubyMine (http://www.jetbrains.com/ruby/index.html)
* Rails >= 3.2 (for older Rails please use version 0.0.2)

## Bugs and Feedback

If you discover any bugs, please send an e-mail to petr@petrcervinka.cz. Positive feedback is fine too!

## How can you help?

If someone knows how to eliminate the need to create ApplScript handler (or how to create this handler programaticaly),
or how to register new protocol programitacly, please let me know.

## References

https://rubygems.org/gems/rubymine_heaven

## License

MIT License.