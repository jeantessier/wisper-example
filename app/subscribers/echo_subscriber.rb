class EchoSubscriber
  def echo(name)
    Rails.logger.info <<~MSG
      [#{self}] echo event:
      [#{self}]     name: #{name} [#{name.class.name}]
    MSG
  end
end
