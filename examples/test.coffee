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
