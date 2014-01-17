require 'spec_helper'

describe HomeController do

  let(:valid_attributes) { { "created" => "2014-01-17 15:12:25" } }

  let(:valid_session) { {} }


  describe "GET 'index'" do

    it "assigns all charges as @charges" do
      charge = Charge.create! valid_attributes
      Charge.stub(:all) { [charge] }
      get :index, {}, valid_session
      expect(assigns(:charges)).to eq([charge])
    end

    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end


end
