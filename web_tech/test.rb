require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
server.mount('/ruby_exam', WEBrick::HTTPServlet::ERBHandler, 'ruby_exam.html.erb')
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
# この一行を追記
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.mount('/ruby_exam1.cgi', WEBrick::HTTPServlet::CGIHandler, 'ruby_exam1.rb')
server.mount('/ruby_exam2.cgi', WEBrick::HTTPServlet::CGIHandler, 'ruby_exam2.rb')
server.start