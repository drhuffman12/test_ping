# Filename: "test_ping.rb"
# See: "https://github.com/javan/whenever"

require 'ping'
require 'json'
puts 'ready'

# require 'ping_timed'


class TestPing
  def ping_echo_dur(host, timeout=5, service="echo")
    info = Hash.new
    info[:tstart] = Time.now
    info[:was_successful] = Ping.pingecho(host, timeout=5, service="echo")
    info[:tdone] = Time.now
    info[:secs] = info[:tdone] - info[:tstart]
    return info # [was_successful, tstart, tdone, secs]
  end
    
    
  def tp(ip,timeout)
    puts '..'
    # puts "test for ip #{ip}: #{ping_echo_dur(ip,timeout).join(',')}"
    puts "test for ip #{ip}: #{ping_echo_dur(ip,timeout).to_json}"
    puts '..'
  end

  def my_tests
    puts
    puts '**** my_tests.start ****'
    # a = 1
    # b = 'xyz'
    # c = Time.now
    # puts "#{JSON::generate([a,b,c])}"
    tp('localhost',5)
    tp('foo',5)
    tp('www.google.com',5)
    tp('google.com',5)
    tp('max.ksc-esc.com',5)
    puts '**** my_tests.done ****'
    puts
  end
end

