Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/transactions/batch", to: "application#test"
  get "/transactions", to: "application#list"

  get "/sellers", to: "application#sellers"
  get "/shops", to: "application#shops"

  post "/shops", to: "application#create_shop"
  post "/sellers", to: "application#create_seller"

  get "/shops/:id", to: "application#shop_detail"
  put "/shops/:id", to: "application#shop_update"

  post "/admin/auth", to: "application#login"

  get "/contacts/house_hold", to: "contacts#index"
  get "/contacts/textiles", to: "contacts#index_2"
end
