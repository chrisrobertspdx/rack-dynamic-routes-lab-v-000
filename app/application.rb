class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)
      item_name = req.path.split("/item/").last
      item = Item.items.find{|i| i.name == item_name}
      if !!item
        resp.write "#{item.name} cost #{item/price}"
      else
        resp.write "Route not found"
        resp.status = 404
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
