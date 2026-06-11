# vim: ft=ruby

begin
  require "awesome_print"
  AwesomePrint.irb!
rescue LoadError
end

IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = File.expand_path("~/.cache/irb_history")
IRB.conf[:USE_AUTOCOMPLETE] = false

def pbcopy(string)
  command = RUBY_PLATFORM =~ /darwin/ ? "pbcopy" : "wl-copy"
  IO.popen(command, "w") { |pipe| pipe.puts string }
  string
end
