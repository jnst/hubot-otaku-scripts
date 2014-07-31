# Description:
#   #NEWGAME!
#
# Dependencies:
#   "moment": "^2.5.1"
#
# Commands:
#   hubot zoi - http://zoi.herokuapp.com/
#
# Author:
#   jnst

moment = require 'moment'

module.exports = (robot) ->

  morning = [
    {
      word: 'がんばる',
      image: 'https://pbs.twimg.com/media/BspTawrCEAAwQnP.jpg',
      src: 'pic.twitter.com/6bdYFIyc3e'
    }, {
      word: 'おはようございまーす',
      image: 'https://pbs.twimg.com/media/Bs7qd4uCAAAwalT.jpg',
      src: 'pic.twitter.com/4EWdIZGmuG'
    }
  ]
  evening = [
    {
      word: 'あきらめる',
      image: 'https://pbs.twimg.com/media/BspWfqoCYAE836J.jpg',
      src: 'pic.twitter.com/lkDaoEEC7H'
    }, {
      word: 'かえる',
      image: 'https://pbs.twimg.com/media/BswuLr2CMAA1SpE.jpg',
      src: 'pic.twitter.com/ltC7iuI7rd'
    }, {
      word: 'きたく',
      image: 'https://pbs.twimg.com/media/BtcSRdRCMAArUCS.jpg',
      src: 'pic.twitter.com/jjXJFYBZjy'
    }, {
      word: 'ねる',
      image: 'https://pbs.twimg.com/media/BtcSM8BCYAE3_8j.jpg',
      src: 'pic.twitter.com/4gZWKWEosT'
    }, {
      word: 'あせる',
      image: 'https://pbs.twimg.com/media/BswuJviCYAMCdGc.png',
      src: 'pic.twitter.com/yh1ObvxjVI'
    }, {
      word: 'きゅうけいにする',
      image: 'https://pbs.twimg.com/media/BtcSU0xCcAAmz_W.jpg',
      src: 'pic.twitter.com/GBqizwBB0Y'
    }, {
      word: 'つかれた',
      image: 'https://pbs.twimg.com/media/BtcSG05CMAEEyIG.jpg',
      src: 'pic.twitter.com/NYs5I3aDP3'
    }
  ]
  anytime = [
    {
      word: 'がんばる',
      image: 'https://pbs.twimg.com/media/BspTkipCIAE4a0n.jpg',
      src: 'pic.twitter.com/7hvwgRmZ2r'
    }, {
      word: 'がんばる',
      image: 'https://pbs.twimg.com/media/BspWSkvCAAAMi43.jpg',
      src: 'pic.twitter.com/VMJbHYLznB'
    }, {
      word: 'がんばる',
      image: 'https://pbs.twimg.com/media/BspWVoqCEAADtZ4.jpg',
      src: 'pic.twitter.com/Y3ht2Ud94J'
    }, {
      word: 'がんばる',
      image: 'https://pbs.twimg.com/media/BspWaPYCAAAI6Ui.jpg',
      src: 'pic.twitter.com/7s5Ke5IQVs'
    }, {
      word: 'がんばる',
      image: 'https://pbs.twimg.com/media/BswuTdaCQAAQCkg.jpg',
      src: 'pic.twitter.com/mrkPJC3DYc'
    }, {
      word: 'あきらめる',
      image: 'https://pbs.twimg.com/media/BspWc7LCAAAPzhS.jpg',
      src: 'pic.twitter.com/DE1dKyLsav'
    }, {
      word: 'あきらめる',
      image: 'https://pbs.twimg.com/media/BtcSLNRCMAAFGoH.jpg',
      src: 'pic.twitter.com/jEHjdl6k3N'
    }, {
      word: 'あきらめる',
      image: 'https://pbs.twimg.com/media/BtcSIHmCUAA8Prp.jpg',
      src: 'pic.twitter.com/IPsYt9K1t2'
    }, {
      word: 'ごはんにする',
      image: 'https://pbs.twimg.com/media/BspWlZFCMAA4fmV.jpg',
      src: 'pic.twitter.com/rWLIjU08mU'
    }, {
      word: 'ごはんにする',
      image: 'https://pbs.twimg.com/media/BswuMrPCEAEECXg.jpg',
      src: 'pic.twitter.com/g0tGY4FtE4'
    }, {
      word: 'ごはんにする',
      image: 'https://pbs.twimg.com/media/BtcSOp6CcAA9_b4.jpg',
      src: 'pic.twitter.com/lcvdPWUnm7'
    }, {
      word: 'ごはんにする',
      image: 'https://pbs.twimg.com/media/BtcSFKpCQAAb73x.jpg',
      src: 'pic.twitter.com/J3NNfZqfFF'
    }, {
      word: 'ねる',
      image: 'https://pbs.twimg.com/media/BspWoBQCcAAm9y5.jpg',
      src: 'pic.twitter.com/Qa4OOuaSb4'
    }, {
      word: 'わかった',
      image: 'https://pbs.twimg.com/media/BswuH1qCcAAueYw.jpg',
      src: 'pic.twitter.com/TzK4f6K8Cf'
    }, {
      word: 'いけるきがする',
      image: 'https://pbs.twimg.com/media/BswuNkICcAE4olR.jpg',
      src: 'pic.twitter.com/npWAwmcME6'
    }, {
      word: 'しんちょくだめです',
      image: 'https://pbs.twimg.com/media/Bsw1StjCQAA9NQ1.jpg',
      src: 'pic.twitter.com/s9R0mikezN'
    }, {
      word: 'きゅうけいにする',
      image: 'https://pbs.twimg.com/media/BswuUTPCYAAVX5n.jpg',
      src: 'pic.twitter.com/onsbKNL4H7'
    }, {
      word: 'ありがとうございます',
      image: 'https://pbs.twimg.com/media/BtcSDbWCQAADuhK.jpg',
      src: 'pic.twitter.com/LCn2AKuz2s'
    }
  ]

  robot.respond /zoi$/i, (msg) ->
    hour = parseInt(moment().hour(), 10)
    if (5 <= hour) and (hour <= 11)
      contents = anytime.concat(morning, morning, morning, morning)
    else if (18 <= hour) or (hour <= 3)
      contents = anytime.concat(evening, evening)
    else
      contents = anytime
    content = msg.random contents
    msg.send "#{content.word}"
    msg.send content.image
