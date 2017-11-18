class Application

  @@items = [Item.new("Figs",3.42), Item.new("Pears",0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.match(/item/)
      item_name = req.path.split("/item/").last
      if my_item = @@items.find{|i| i.name == item_name}
        resp.write "#{my_item.name} cost #{my_item.price}"
        # resp.status = 200
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
