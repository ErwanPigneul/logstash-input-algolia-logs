# encoding: utf-8
require "logstash/inputs/base"
require "logstash/namespace"
require "stud/interval"

# Generate a repeating message.
#
# This plugin is intented only as an example.

class LogStash::Inputs::Algolialogs < LogStash::Inputs::Base
  config_name "algolialogs"

  # If undefined, Logstash will complain, even if codec is unused.
  default :codec, "plain" 

  # The application_id of algolia cluster.
  config :application_id , :validate => :string, :required => true

  # The api_key of algolia cluster (must be an admin key).
  config :api_key , :validate => :string, :required => true

  # The size of logs to retrieve.
  config :length , :validate => :number, :default => 1000

  # The type of logs to retrieve.
  config :type , ::validate => [ "query", "build", "error"]

  # Set how frequently messages should be sent.
  #
  # The default, `1`, means send a message every second.
  config :interval, :validate => :number, :default => 600

  public
  def register
    require algoliasearch

    Algolia.init :application_id => @application_id,
                  :api_key        => @api_key



  end # def register

  def run(queue)
    Stud.interval(@interval) do
      logs = Algolia.get_logs(0, @length, false, defined? @type ? @type)
      for log in logs
        event = LogStash::Event.new(log)
        decorate(event)
        queue << event
      end
    end # loop
  end # def run

end # class LogStash::Inputs::Example