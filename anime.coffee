# Description:
#   Today's anime
#
# Dependencies:
#   "lodash": ">=2.0.0"
#
# Commands:
#   hubot anime    - today's tokyo anime schedule
#   hubot nyanpass - にゃんぱすー
#   hubot ガガントス - ガガントス＞＜
#
# Author:
#   jnst

_ = require 'lodash'

class Anime
  constructor: (item) ->
    @title = item.title
    @number = item.next
    @time = item.time
    @station = item.station
  show: ->
    '　' + @time + ' ' + @title + ' ' + @number

class Lineup
  constructor: ->
    @list = []
  add: (anime) ->
    @list.push anime
  contains: (title) ->
    _.some(@list, { title: title })
  show: ->
    strs = []
    for anime in @list
      strs.push anime.show()
    strs.join '\n'

contents = [
  'にゃんぱすー'
  'にゃんぱすー (ceilingcat)'
  'にゃんぱすー (heart)'
  'にゃんぱすー (sadpanda)'
  '膝…やっちまいました…'
  'http://i.imgur.com/WSxU1k5.jpg'
  'http://i.imgur.com/aQp7PmT.jpg'
  'https://24.media.tumblr.com/e9ac13abb4127224728fe3160305bdc4/tumblr_mw01wqN0uO1s98xkso1_500.gif'
  'http://24.media.tumblr.com/3f9a37fd09e5edffaf142fafc77021fa/tumblr_mv01ttixkm1qzhmnlo1_500.jpg'
  'http://24.media.tumblr.com/77739603525e6090b3ebe7d5e3fb00f3/tumblr_mxwuk7PzLq1sq9yswo1_500.gif'
  'http://24.media.tumblr.com/4ba50a4a731a522def3e2e4d7a55705e/tumblr_mwh0hshwvk1sq9yswo1_500.gif'
  'http://24.media.tumblr.com/66dedcfface1d3157759d210b289bdbe/tumblr_mwh0hshwvk1sq9yswo2_500.gif'
  'http://24.media.tumblr.com/8457167f2a8b95cf3e35755c77c51e1f/tumblr_mwhq0vOg9q1qzespeo1_500.gif'
  'http://24.media.tumblr.com/7e31c56f06c449763708563f5bc0ca95/tumblr_mx6y31JQBG1qzespeo1_r1_500.gif'
  'http://31.media.tumblr.com/16f67944e5a280befcdffdfb7b8807bc/tumblr_mxkj97YpMu1src1c6o1_500.gif'
]

souleaters = [
  'http://livedoor.4.blogimg.jp/ponpokonwes/imgs/b/1/b12bbe6e.gif'
  'http://livedoor.4.blogimg.jp/ponpokonwes/imgs/b/8/b870547a.gif'
  'https://pbs.twimg.com/media/BnAKIWDCMAACECk.jpg'
  'https://pbs.twimg.com/media/Bl12NkWCQAAEH6v.png'
]

module.exports = (robot) ->

  filterByToday = (items) ->
    _.filter(items, (i) ->
      i.today is '1'
    )

  parse = (items) ->
    lineup = new Lineup
    for i in items
      lineup.add(new Anime(i))
    lineup

  robot.respond /anime$/i, (msg) ->
    msg.http("http://animemap.net/api/table/tokyo.json")
      .get() (err, res, body) ->
        items = filterByToday JSON.parse(body).response.item
        lineup = parse items
        msg.send "今夜は#{items.length}つのアニメが放送されるよ！\n#{lineup.show()}"

  robot.respond /nyanpas[s|u]$|にゃんぱす.{0,1}$/i, (msg) ->
    msg.send msg.random contents

  robot.respond /ガガントス$/i, (msg) ->
    msg.send msg.random souleaters
