require "bundler/setup"
require "sarb"

app = Sarb::Application.new

app.action(:auth) do |session, args|
  session.instance_variable_set(:@name, args["name"])
end

app.action(:chat) do |session, args|
  if session.instance_variable_get(:@name).nil?
    session.message("You must auth first")
  else
    app.message_all("#{session.instance_variable_get(:@name)}: #{args["chat"]}", Set.new([session])) # You can remove the final parameter if you would like to person sending the chat to receive the message as well.
  end
end

app.run

