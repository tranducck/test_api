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

  get "/tracking_info/:tracking", to: "application#tracking"
  post "/domains", to: "application#domain"

  get "/retailer/:retailer_id/warehouses", to: "application#warehouse"
  get "/retailer/:retailer_id/stocks", to: "application#stock"
  get "/retailer/:retailer_id/stock_histories", to: "application#history"

  get "/request_merges", to: "application#merge"
  get "/request_splits", to: "application#split"

  get "/shopify_products", to: "application#shopify_products"
  get "/shopify_products/:id", to: "application#shopify_product_detail"

  get "/line_items", to: "application#line_item"
  get "/line_items/report", to: "application#item_report"
  get "/tracking_info", to: "application#tracking_info"
  get "/stock_histories", to: "application#histories"
  post "/permissions", to: "application#permission"
  post "/authentication", to: "application#authen"

  post "//bulk_fulfillments", to: "application#fulfill"
end
