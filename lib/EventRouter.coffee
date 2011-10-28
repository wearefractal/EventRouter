require('coffee-script');
{EventEmitter} = require 'events'

class EventRouter extends EventEmitter
  routes = []
  constructor: (@parent) ->
  route: (event, filter) -> 
    filter ?= -> true
    listener = (args...) => 
      if filter.apply null, arguments 
        args.unshift event
        @emit.apply @, args
        
    @parent.on event, listener
    routes.push [event, listener, filter]
  
module.exports = EventRouter
