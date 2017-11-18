class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      my_item = req.path.split("/items/").last
      if my_item = Item.find{|i| i.name == item_name}
        resp.write "#{my_item.name} cost #{my_item.price}"
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
