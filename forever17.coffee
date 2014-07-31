# Description:
#   Forever Seventeen
#
# Dependencies:
#   "moment": "^2.5.1"
#
# Commands:
#   hubot forever17 age - Replay your age
#   hubot forever17 yyyy-MM-dd - Replay your age
#   hubot forever17 yyyy/MM/dd - Replay your age
#
# Author:
#   jnst

moment = require 'moment'

module.exports = (robot) ->

  description = (ymd) ->
    array = if ~ymd.indexOf('-') then ymd.split('-') else ymd.split('/')
    birth = moment(array)
    now = moment()
    month = now.diff(birth, 'months')
    "17歳と#{month - (17 * 12) + 1}ヶ月です☆"

  robot.respond /forever17 (\d{4}-\d{2}-\d{2})/i, (msg) ->
    ymd = msg.match[1].trim()
    msg.send description(ymd)

  robot.respond /forever17 (\d{4}\/\d{2}\/\d{2})/i, (msg) ->
    ymd = msg.match[1].trim()
    msg.send description(ymd)

  robot.respond /forever17 (\d{1,3}$)/i, (msg) ->
    age = +msg.match[1].trim()
    if age is 17
      msg.send "17歳です☆"
    else
      msg.send "17歳と#{(age - 17) * 12 + (moment().month() + 1)}ヶ月です☆"

  robot.respond /forever17$/i, (msg) ->
    msg.send "please input 'hubot forever17 yyyy/MM/dd'"
