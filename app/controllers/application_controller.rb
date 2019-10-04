class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token  

  def test
    a = {
      message: 'Success'
    }
    render json: a
  end

  def list
    status = params[:status]
    shop_id = params[:shop_id].to_i

    if (!status.present? || shop_id === 0)
      n = 20
    else
      n = 10
    end

    transactions = (1..n).map do |i|
      {
        id: i,
        shop_id: shop_id > 0 ? shop_id : i > 7 ? 1 : 2,
        payment_ref: "ref_0#{i}",
        amount: i > 5 ? "-#{i * 2.01}" : "#{10 + i}",
        adyen_transaction_id: 1020 + i,
        adyen_status: status.present? ? status : i > 5 ? 'SETTLE' : 'RECEIVED',
        adyen_fee: 2.96,
        adyen_created_at: "7/26/17 0:01",
        fee: 19.2,
      }
    end

    sleep 1.5
    render json: {
      transactions: transactions
    }
  end

  def sellers
    a = {
      sellers: [
        {
          id: 1,
          email: 'test@example.com',
          name: 'Lorem Ipsum',
          status: 'active'
        },
        {
          id: 2,
          email: 'foo@bar.co',
          name: 'Foo Bar',
          status: 'active',
        },
        {
          id: 3,
          email: 'nothing@null.com',
          name: 'Nothing',
          status: 'active',
        },
      ],
      total: 100,
    }

    render json: a
  end

  def shops
    sleep 1.5
    a = {
      shops: [
        {
          id: 1,
          seller_id: 1,
          name: 'lorem1.myshopify.com',
          merchant_account: 'UK1992',
        },
        {
          id: 2,
          seller_id: 1,
          name: 'test-shop.myshopify.com',
          merchant_account: 'UK13241',
        },
        {
          id: 3,
          seller_id: 2,
          name: 'foobar.myshopify.com',
          merchant_account: 'US1234',
        },
      ],
      total: 100,
    }

    render json: a
  end

  def create_shop
    sleep 1.5

    shop = params[:shop]
    shop_res = {
      shop: {
        id: Time.now.to_i,
        seller_id: shop[:seller_id],
        name: shop[:name],
        merchant_account: shop[:merchant_account],
      }
    }

    render json: shop_res
  end

  def create_seller
    shop = {
      id: Time.now.to_i
    }
    seller = {
      id: 1
    }
    render json: {
      shop: shop,
      seller: seller,
    }
  end

  def shop_detail
    shop = {
      id: params[:id],
      name: 'Lorem ipsum dolores',
      merchant_account: 'UPAY001',
      fee_static: 1.8,
      fee_percent: 20,
      hold_percent: 20,
      hold_days: 5,
      min_balance: 10,
    }

    sleep 1
    render json: {
      shop: shop
    }
  end

  def shop_update
    sleep 1
    render json: {
      shop: params[:shop]
    }
  end

  def login
    sleep 1
    render json: {
      data: {
        token_key: 'something'
      }
    }
  end

  def tracking
    sleep 1.4
    render json: {
      data: {
        paypal: ['yes', 'no'].sample,
        shopify: ['yes', 'no'].sample,
      }
    }
  end

  def domain
    sleep 1.5
    render json: {
      data: {
        domain: {
          id: 1,
          domain_name: params[:domain][:name]
        }
      }
    }
  end

  def warehouse
    sleep 1
    list = []

    (1..7).each do |i|
      warehouse = {
        id: i,
        code: "code_#{i}",
        name: "Warehouse_#{i}",
        retailer_id: params[:retailer_id].to_i,
        address: "co khi",
        description: "Lorem ipsum dolores",
      }
      list.push(warehouse)
    end

    render json: {
      warehouses: list
    }
  end

  def stock
    sleep 1
    list = []

    (1..10).each do |i|
      warehouse = {
        id: i,
        retailer_id: params[:retailer_id],
        retailer_warehouse_code: params[:warehouse_code],
        warehouse_code: params[:warehouse_code],
        usku: "usku_#{i}",
        quantity: rand(100)
      }
      list.push(warehouse)
    end

    render json: {
      stocks: list
    }
  end

  def history
    sleep 1
    list = []

    (1..10).each do |i|
      today = Date.today
      date = today - i.days - i.hours
      warehouse = {
        usku: params[:usku],
        quantity: rand(-100..100),
        request_code: "request_#{i}",
        request_type: ['IMPORT', 'EXPORT'].sample,
        created_at: date.to_s
      }

      list.push(warehouse)
    end
    render json: {
      usku: params[:usku],
      warehouse_id: params[:warehouse_id].to_i,
      retailer_id: params[:retailer_id].to_i,
      stock_histories: list,
    }
  end

  def shopify_products
    sleep 1
    variants = [
      {
        "id": 808950810,
        "image_id": 562641783,
        "product_id": 632910392,
        "title": "Pink",
        "sku": "IPOD2008PINK",
        "option1": "Pink",
        "option2": nil,
        "option3": nil,
      },
      {
        "id": 49148385,
        "product_id": 632910392,
        "title": "Red",
        "sku": "IPOD2008RED",
        "option1": "Red",
        "option2": nil,
        "option3": nil,
        "image_id": nil,
      },
      {
        "id": 39072856,
        "product_id": 632910392,
        "title": "Green",
        "sku": "IPOD2008GREEN",
        "option1": "Green",
        "option2": nil,
        "option3": nil,
        "image_id": nil,
      },
      {
        "id": 457924702,
        "product_id": 632910392,
        "title": "Black",
        "sku": "IPOD2008BLACK",
        "option1": "Black",
        "option2": nil,
        "option3": nil,
        "image_id": nil,
      }
    ]
    products = [
      {
        "id": 632910392,
        "title": "IPod Nano - 8GB",
        variants: variants,
        options: [
          {
            "name": "Color",
            "position": 1,
            "values": [
              "Pink",
              "Red",
              "Green",
              "Black"
            ]
          }
        ],
        images: [
          {
            "id": 850703190,
            "src": "https://cdn.shopify.com/s/files/1/2363/1929/products/Size-35-44-Genuine-Leather-Shoes-Women-Pointed-Toe-Flats-Ballerina-Slip-On-Loafers-Moccasins-Ladies.jpg_640x640_b33515bb-3656-4cf9-8caf-2b2155667fda.jpg?v=1550045686",
          },
          {
            "id": 562641783,
            "src": "https://cdn.shopify.com/s/files/1/2363/1929/products/Size-35-44-Genuine-Leather-Shoes-Women-Pointed-Toe-Flats-Ballerina-Slip-On-Loafers-Moccasins-Ladies.jpg_640x640_6456796d-b374-463b-a9f4-8a36a748b6b9.jpg?v=1550045686"
          },
          {
            "id": 850703190,
            "src": "https://cdn.shopify.com/s/files/1/2363/1929/products/Size-35-44-Genuine-Leather-Shoes-Women-Pointed-Toe-Flats-Ballerina-Slip-On-Loafers-Moccasins-Ladies.jpg_640x640_84d04004-bab5-4d9f-9c3c-01e10f5bbdc4.jpg?v=1550045686"
          }
        ]
      }
    ]

    render json: {
      products: products,
    }
  end

  def shopify_product_detail
    sleep 1
    variants = [
      {
        "id": 808950810,
        "image_id": 562641783,
        "product_id": 632910392,
        "title": "Pink",
        "sku": "IPOD2008PINK",
        "option1": "Pink",
        "option2": nil,
        "option3": nil,
      },
      {
        "id": 49148385,
        "product_id": 632910392,
        "title": "Red",
        "sku": "IPOD2008RED",
        "option1": "Red",
        "option2": nil,
        "option3": nil,
        "image_id": nil,
      },
      {
        "id": 39072856,
        "product_id": 632910392,
        "title": "Green",
        "sku": "IPOD2008GREEN",
        "option1": "Green",
        "option2": nil,
        "option3": nil,
        "image_id": nil,
      },
      {
        "id": 457924702,
        "product_id": 632910392,
        "title": "Black",
        "sku": "IPOD2008BLACK",
        "option1": "Black",
        "option2": nil,
        "option3": nil,
        "image_id": nil,
      }
    ]
    product = {
      "id": 632910392,
      "title": "IPod Nano - 8GB",
      variants: variants,
      options: [
        {
          "name": "Color",
          "position": 1,
          "values": [
            "Pink",
            "Red",
            "Green",
            "Black"
          ]
        }
      ],
      images: [
        {
          "id": 850703190,
          "src": "https://cdn.shopify.com/s/files/1/2363/1929/products/Size-35-44-Genuine-Leather-Shoes-Women-Pointed-Toe-Flats-Ballerina-Slip-On-Loafers-Moccasins-Ladies.jpg_640x640_b33515bb-3656-4cf9-8caf-2b2155667fda.jpg?v=1550045686",
        },
        {
          "id": 562641783,
          "src": "https://cdn.shopify.com/s/files/1/2363/1929/products/Size-35-44-Genuine-Leather-Shoes-Women-Pointed-Toe-Flats-Ballerina-Slip-On-Loafers-Moccasins-Ladies.jpg_640x640_6456796d-b374-463b-a9f4-8a36a748b6b9.jpg?v=1550045686"
        },
        {
          "id": 850703190,
          "src": "https://cdn.shopify.com/s/files/1/2363/1929/products/Size-35-44-Genuine-Leather-Shoes-Women-Pointed-Toe-Flats-Ballerina-Slip-On-Loafers-Moccasins-Ladies.jpg_640x640_84d04004-bab5-4d9f-9c3c-01e10f5bbdc4.jpg?v=1550045686"
        }
      ]
    }

    render json: {
      product: product,
    }
  end

  def line_item
      a = []
      (2.week.ago.to_date..1.week.ago.to_date).each do |d|
          data = {
            total: rand(100..1000),
            date: d.strftime("%Y-%m-%d"),
          }
          a.push(data)
      end

      sleep 1.5
      render json: {
        data: a
      }
  end

  def item_report
      a = []
      (2.week.ago.to_date..1.week.ago.to_date).each do |d|
        b = []
        (d.to_date..Date.today).each do |e|
          datetime = e.strftime("%Y-%m-%d")
          h = {}
          h[datetime] = rand(100..200)
          b.push h
        end
        datestring = d.strftime("%Y-%m-%d")
        g = {}
        g[datestring] = b
        a.push(g)
      end

      sleep 1.5
      render json: {
        data: a
      }
    
  end

  def tracking_info
    a = [
      {
        order_id: '3692151_2233325_514852',
        tracking_number: 'LZ1907324CN',
      },
      {
        order_id: '3692151_2233325_514852',
        tracking_number: 'LZ01234JN',
      },
      {
        order_id: '3692112_2233287_514851',
        tracking_number: 'LC2321321JN',
      },
    ]
    

    sleep 1.5
    render json: {
      tracking_info: a
    }
  end

  def histories
    a = [
      {
        created_at: 1567565497,
        quantity: 1,
        sri_code: 'RI_0IH_08301910RCSS_RD3851L0',
        by: {
          type: 'ffm',
          object: { info: 'test@upinus.com' },
        },
      },
      {
        created_at: 1567565497,
        quantity: 1,
        sri_code: 'RI_0IH_08301910RCSS_RD3851L0',
        by: {
          type: 'ffm',
          object: { info: 'test@upinus.com' },
        },
      },
      {
        created_at: 1567565497,
        quantity: 1,
        sri_code: 'RI_0IH_08301910RCSS_RD3851L0',
        by: {
          type: 'ffm',
          object: { info: 'test@upinus.com' },
        },
      },
      {
        created_at: 1567565497,
        quantity: 1,
        sri_code: 'RI_0IH_08301910RCSS_RD3851L0',
        by: {
          type: 'ffm',
          object: { info: 'test@upinus.com' },
        },
      },
      {
        created_at: 1567565497,
        quantity: 1,
        sri_code: 'RI_0IH_08301910RCSS_RD3851L0',
        by: {
          type: 'ffm',
          object: { info: 'test@upinus.com' },
        },
      },
    ]

    sleep 1
    if params[:page].to_i >= 4
      render json: {
        total: 15,
        histories: [],
      }
    else
      render json: {
        total: 15,
        histories: a,
      }
    end
  end

  def permission
    sleep 1.5

    render json: {
      permission_link: 'http://localhost:8080' 
    }
  end

  def authen
    sleep 1.5

    render json: {
      ok: 'okee'
    }
  end

  def fulfill
    sleep 1.5
    a = params[:fulfillments].map do |f|
      random = [true, false].sample
      if random
        status = 'success'
        reason = ''
      else
        status = 'fail'
        reason = '1234'
      end
      {
        order_name: f["order_name"],
        tracking_number: f["tracking_number"],
        sku: f["sku"],
        quantity: f["quantity"],
        status: status,
        reason: reason
      }
    end
    render json: {
      fulfillments: a
    }
  end
end
