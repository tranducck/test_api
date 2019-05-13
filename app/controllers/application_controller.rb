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

end
