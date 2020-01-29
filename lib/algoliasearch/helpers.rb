module Helpers
  # Convert an Hash to json
  #
  def self.to_json(body)
    body.is_a?(String) ? body : MultiJson.dump(body)
  end

  def self.to_string(opt)
    opt.is_a?(String) ? opt : opt.to_s
  end

  # Convert params to a full query string
  #
  def self.handle_params(params)
    params.nil? || params.empty? ? '' : "?#{to_query_string(params)}"
  end

  # Create a query string from params
  #
  def self.to_query_string(params)
    params.map do |key, value|
      "#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s)}"
    end.join('&')
  end

  # Format params to Hash
  #
  def self.to_hash(params)
    Hash[params.map { |key, value| [key.to_s, value.is_a?(Array) ? MultiJson.load(value) : value] }]
  end
end