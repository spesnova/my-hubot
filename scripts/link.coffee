# Description:
#   A way to bookmark links.
#
# Dependencies:
#   "githubot": "0.4.x"
#
# Configuration:
#   None
#
# Commands:
#   hubot link me - Displays all of the links that Hubot knows about.
#   hubot link me <query> - Displays all links that match <query>.
#
# Author:
#   spesnova

fuzzy = require "fuzzy-filter"
links = require "../data/links.json"

module.exports = (robot) ->

  robot.respond /link\s(me)?\s*(.*)?/i, (msg) ->
    query = null
    query = msg.match[2] if msg.match[2]

    response = ""

    if query is null
      for linkName, url of links
        response += "#{linkName}: #{url}\n"
    else
      for linkName in fuzzy(query, Object.keys links)
        response += "#{linkName}: #{links[linkName]}\n"

    msg.send response
