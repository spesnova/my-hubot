# Description:
#   script in hackathon
#
# Commands:
#   hubot link me <query> - Lists urls concern wantedly
#   hubot cheer me - Hubot cheer you :)
#   hubot hi|hello - greeting

fuzzy   = require "fuzzy-filter"
cronJob = require('cron').CronJob

module.exports = (robot) ->

  #
  # Sandwich notify
  #
  new cronJob '0 40 11 * * 1-5', () ->
    room = {
      # TODO(spesnova): change room
      room: '21266_team_green@conf.hipchat.com',
    }
    robot.send room, "@aki http://www.kiwikitchen.com/japanese/lunch/images/lunch_chicken.jpg"
    robot.send room, "@aki A sandwich will come soon!"
  , null, true, "Asia/Tokyo"

  #
  # link me
  #
  robot.respond /link( me)?\s*(.*)?/i, (msg) ->
    links = {
      "Wantedly": "https://www.wantedly.com/",
      "Wantedly Staging": "https://staging.wantedly.com/",
      "Wantedly QA": "http://qa.wantedly.com/"
      "Admin Dashboard": "https://staging.wantedly.com/admin",
      "Sales Dashboard": "https://staging.wantedly.com/admin/sales",
      "Base": "https://wantedly.atlassian.net",
      "Heroku Dashboard": "https://dashboard.heroku.com/apps",
      "Facebook Developers Dashboard Wantedly App": "https://developers.facebook.com/x/apps/234170156611754/dashboard/"
    }

    link_name = null
    link_name = msg.match[2] if msg.match[2]

    message = ""

    if link_name isnt null
      for name in fuzzy(link_name, Object.keys links)
        message += "#{name}: #{links[name]}\n"
    else
      for name, url of links
        message += "#{name}: #{url}\n"

    msg.send message

  #
  # cheer me
  #
  robot.respond /cheer( me)?/i, (msg) ->
    messages = {
      "Naoyoshi Aikawa": "https://s3.amazonaws.com/uploads.hipchat.com/21266/377746/5VBTSFbS7HXGT10/1090934_10151639084846799_1540247221_o.jpg",
      "Seigo Uchida": "http://1.bp.blogspot.com/-kFkBNlTyKXg/TV3HTQd-fYI/AAAAAAAAB2I/jgycUT7SIIw/s1600/redbull02.JPG",
      "Sumida Komugi": "http://omosiro-trend.com/wp-content/uploads/2013/11/matudashouta21.jpg",
      "Rei Kubonaga": "https://s3.amazonaws.com/uploads.hipchat.com/21266/377746/104wwGUnV8AS2gk/1452268_753763324637586_938730497_n__1_.png"
    }

    msg.reply messages[msg.message.user.name]

  #
  # Hello
  #
  robot.respond /(hi|hello|good morning|おはよう)/i, (msg) ->
    msg.reply msg.match[1]
