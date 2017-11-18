class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/item/)
      item_title = req.path.split("/item/").last
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end