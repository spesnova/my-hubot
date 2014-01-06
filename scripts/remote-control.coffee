# Description:
#   A way to remote control TV, speaker, air conditioner etc.
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_IRKIT_ENDPOINT
#
# Commands:
#   hubot turn on <target> - Turn on ( tv | ac | sp ).
#   hubot turn off <target> - Turn off ( tv | ac | sp ).
#
# Author:
#   spesnova

signals = require "../data/signals.json"
endpoint = process.env.HUBOT_IRKIT_ENDPOINT

module.exports = (robot) ->
  robot.respond /turn\s*on\s*(.*)/i, (msg) ->
    target = msg.match[1]
    data = JSON.stringify signals[target]["on"]

    robot.http(endpoint)
      .post(data) (err, res, body) ->
        if err
          msg.send "Encountered an error :("
          robot.logger.debug err
          return
        msg.send "The #{target} turned on"

  robot.respond /turn\s*off\s*(.*)/i, (msg) ->
    target = msg.match[1]
    data = JSON.stringify signals[target]["off"]

    robot.http(endpoint)
      .post(data) (err, res, body) ->
        if err
          msg.send "Encountered an error :("
          robot.logger.debug err
          return
        msg.send "The #{target} turned off"
