class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)



    if req.path.match(/item/)
      item_name = req.path.split("/item/").last
      my_item = Item.items.find{|i| i.name == item_name}
      if my_item != nil
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
