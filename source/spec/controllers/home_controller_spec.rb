require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do

    it "assigns all failed charges as @failed_charges" do
      failed_charge = Charge.create(created: "2014-01-17 13:43:31", paid: false, amount: 1.5, currency: "usd", refunded: false, customer_id: 1)
      get 'index'
      expect(assigns(:failed_charges)).to eq([failed_charge])
    end

    it "assigns all disputed charges as @disputed_charges" do
      disputed_charge = Charge.create(created: "2014-01-17 13:43:31", paid: true, amount: 1.5, currency: "usd", refunded: true, customer_id: 1)
      get 'index'
      expect(assigns(:disputed_charges)).to eq([disputed_charge])
    end

    it "assigns all successful charges as @successful_charges" do
      successful_charge = Charge.create(created: "2014-01-17 13:43:31", paid: true, amount: 1.5, currency: "usd", refunded: false, customer_id: 1)
      get 'index'
      expect(assigns(:successful_charges)).to eq([successful_charge])
    end

    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end

  end

end

