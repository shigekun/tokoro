should    = require 'should'
tokoro    = require '../src/'
fs        = require 'fs'
path      = require 'path'
djb       = require '../lib/djb'
base94    = require '../lib/base94'
normalize = require '../lib/normalize'

describe 'tokoro', ->

  @timeout 10000

  describe 'Libraries', ->

    it '35662696をbase94でエンコード', (done) ->
      base94.encode(35662696).should.equal "Ky'E"
      done()

    it "Ky'Eをbase94でデコード", (done) ->
      base94.decode("Ky'E").should.equal 35662696
      done()

  describe 'Node/io.js', ->

    it '東京都世田谷区粕谷一丁目25', (done) ->
      tokoro '東京都世田谷区粕谷一丁目25', (code) ->
        code[0].should.equal 35.662696
        code[1].should.equal 139.614003
        done()
