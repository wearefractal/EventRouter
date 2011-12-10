**EventRouter is a library to route and conditionally filter events**

## Installation
    
To install EventRouter, use [npm](http://github.com/isaacs/npm):

    $ npm install eventrouter

## Usage

```javascript
var EventRouter = require('eventrouter');
mainEmitter = new CoolEmitter();
example = new EventRouter(mainEmitter);
example.route(event, filter);
```

## Examples

```coffee-script
EventRouter = require '../lib/EventRouter'
{EventEmitter} = require 'events'

connection = new EventEmitter
call = new EventRouter connection

# Any 'incoming' events from connection will be echoed by call if the ID is 0
call.route 'incoming', (call) -> call.id is 0
    
call.on 'incoming', (call) -> console.log "Passed the call filter with CallID #{ call.id }"

connection.emit 'incoming', {id: 1} # Should be ignored
connection.emit 'incoming', {id: 2} # Should be ignored
connection.emit 'incoming', {id: 3} # Should be ignored
connection.emit 'incoming', {id: 0} # Should repeat

call.route 'message'
call.on 'message', (text) -> console.log "Passed message filter with #{ text }"
connection.emit 'message', 'something' # Should repeat
connection.emit 'message', 'wadup doe' # Should repeat
```

You can view further examples in the [example folder.](https://github.com/wearefractal/EventRouter/tree/master/examples)

## LICENSE

(MIT License)

Copyright (c) 2011 Fractal <contact@wearefractal.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
