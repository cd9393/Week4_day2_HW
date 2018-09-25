require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative("./models/pizza_order")
also_reload("./models/*")

get "/" do
  erb(:home)
end

#index route to all pizza-orders
get "/pizza-orders" do
  @orders = PizzaOrder.all()
  erb(:index)
end

#create pizza
get '/pizza-orders/new' do
  erb(:new)
end

# show - show one pizza (by id) This should always be at the bottom.
get "/pizza-orders/:id" do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

#create - make a PizzaOrder
post "/pizza-orders" do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

#Delete- delete a single order.
post "/pizza-orders/:id/destroy" do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  redirect "/pizza-orders"
end

#edit - update a single order
get "/pizza-orders/:id/update" do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

#update database
post "/pizza-orders/:id/update" do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect "/pizza-orders"
end
