require 'pry'

# class Application
#
#   @@items = ["Apples","Carrots","Pears"]
#
#   def call(env)
#     res = Rack::Response.new
#     req = Rack::Request.new(env)
#
#     if req.path.match(/items/)
#       @@items.each do |item|
#         res.write "#{item}\n"
#       end
#     else
#       res.write "Path Not Found"
#     end
#
#     res.finish
#   end
# end

class Application

  @@items = ["Apples","Carrots","Pears"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)

      search_term = req.params["q"]

      binding.pry

      if @@items.include?(search_term)
        resp.write "#{search_term} is one of our items"
      else
        resp.write "Couldn't find #{search_term}"
      end

    else
      resp.write "Path Not Found"
    end

    resp.finish
  end
end
