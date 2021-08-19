class EchoSubscriber
  def self.echo(name)
    Rails.logger.info <<~MSG
      [#{self}] echo event:
      [#{self}]     name: #{name} [#{name.class.name}]
    MSG

    actual_sleep = sleep(10)

    Rails.logger.info <<~MSG
      [#{self}] Slept #{actual_sleep} secs.
      [#{self}] Done.
    MSG
  end
end
