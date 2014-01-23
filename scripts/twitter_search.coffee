# Description:
#   A way to search tweet.
#
# Commands:
#   hubot search twitter <search_term> - Search tweet
#   hubot search twitter <search_term> <n> - Search tweet
#
# Dependencies:
#   twit 
#
# Configuration:
#   HUBOT_TWITTER_CONSUMER_KEY
#   HUBOT_TWITTER_CONSUMER_SECRET
#   HUBOT_TWITTER_MENTION_QUERY
#   HUBOT_TWITTER_MENTION_ROOM
#
# Author:
#   spesnova

Twit = require "twit"
twitterConfig  = {
  consumer_key:        process.env.HUBOT_TWITTER_CONSUMER_KEY
  consumer_secret:     process.env.HUBOT_TWITTER_CONSUMER_SECRET
  access_token:        process.env.HUBOT_TWITTER_ACCESS_TOKEN
  access_token_secret: process.env.HUBOT_TWITTER_ACCESS_TOKEN_SECRET
}
twitter = new Twit twitterConfig

module.exports = (robot) ->
  robot.respond /search\s(tw|twitter|tweet)\s+(\S+)\s?(\d?)/i, (msg) ->
    message = ""
    keyword = msg.match[2]
    n       = 5
    n       = msg.match[3] if msg.match[3] isnt ''

    twitter.get "search/tweets", { q: keyword, count: n }, (err, reply) ->
      return msg.send "@seigo Error has occured at search twitter" if err
      #robot.logger.debug reply.statuses

      for tweet in reply.statuses
        msg.send "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id_str}"
