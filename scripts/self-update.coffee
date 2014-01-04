# Description:
#   Update hubot via chef-client.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot self-update - Hubot update self.
#
# Author:
#   spesnova

exec = require("child_process").exec
fs   = require("fs")

module.exports = (robot) ->

  robot.respond /self-update/i, (msg) ->
    msg.send "Updating myself, please wait to mention me :)"
    intervalID = setInterval () ->
        msg.send "please wait..."
      , 2 * 1000

    # TODO(spesnova): create log directory
    exec "sudo chef-client > /home/hubot/self-update.log", (err, stdout, stderr) ->
      if err
        robot.logger.debug err
        msg.send "Something wrong in updating process :("
      clearInterval(intervalID)
