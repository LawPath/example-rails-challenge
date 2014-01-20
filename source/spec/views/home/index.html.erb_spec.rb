require 'spec_helper'

describe "home/index" do
  before(:each) do
    assign(:failed_charges, [
      stub_model(Charge,
        :created => "2001-01-17 13:43:31",
        :paid => false,
        :amount => 1,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'John', :last_name => 'Smith')
      ),
      stub_model(Charge,
        :created => "2010-01-20 10:43:39",
        :paid => false,
        :amount => 1.5,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'Bob', :last_name => 'Dylan')
      ),
      stub_model(Charge,
        :created => "1990-01-17 19:43:58",
        :paid => false,
        :amount => 2,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'Bob', :last_name => 'Marley')
      ),
      stub_model(Charge,
        :created => "1999-01-17 07:20:31",
        :paid => false,
        :amount => 2.5,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'Bon', :last_name => 'Jovi')
      ),
      stub_model(Charge,
        :created => "2015-01-17 01:13:02",
        :paid => false,
        :amount => 3,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'Alicia', :last_name => 'Keys')
      )
    ])

    assign(:disputed_charges, [
      stub_model(Charge,
        :created => "2001-01-17 13:43:31",
        :paid => true,
        :amount => 1,
        :currency => "usd",
        :refunded => true,
        :customer => stub_model(Customer, :first_name => 'John', :last_name => 'Smith')
      ),
      stub_model(Charge,
        :created => "2010-01-20 10:43:39",
        :paid => true,
        :amount => 1.5,
        :currency => "usd",
        :refunded => true,
        :customer => stub_model(Customer, :first_name => 'Bob', :last_name => 'Dylan')
      ),
      stub_model(Charge,
        :created => "1990-01-17 19:43:58",
        :paid => true,
        :amount => 2,
        :currency => "usd",
        :refunded => true,
        :customer => stub_model(Customer, :first_name => 'Bob', :last_name => 'Marley')
      ),
      stub_model(Charge,
        :created => "1999-01-17 07:20:31",
        :paid => true,
        :amount => 2.5,
        :currency => "usd",
        :refunded => true,
        :customer => stub_model(Customer, :first_name => 'Bon', :last_name => 'Jovi')
      ),
      stub_model(Charge,
        :created => "2015-01-17 01:13:02",
        :paid => true,
        :amount => 3,
        :currency => "usd",
        :refunded => true,
        :customer => stub_model(Customer, :first_name => 'Alicia', :last_name => 'Keys')
      )
    ])

    assign(:successful_charges, [
      stub_model(Charge,
        :created => "2001-01-17 13:43:31",
        :paid => true,
        :amount => 1,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'John', :last_name => 'Smith')
      ),
      stub_model(Charge,
        :created => "2010-01-20 10:43:39",
        :paid => true,
        :amount => 1.5,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'Bob', :last_name => 'Dylan')
      ),
      stub_model(Charge,
        :created => "1990-01-17 19:43:58",
        :paid => true,
        :amount => 2,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'Bob', :last_name => 'Marley')
      ),
      stub_model(Charge,
        :created => "1999-01-17 07:20:31",
        :paid => true,
        :amount => 2.5,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'Bon', :last_name => 'Jovi')
      ),
      stub_model(Charge,
        :created => "2015-01-17 01:13:02",
        :paid => true,
        :amount => 3,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'Alicia', :last_name => 'Keys')
      ),
      stub_model(Charge,
        :created => "2001-01-17 13:43:31",
        :paid => true,
        :amount => 1,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'John', :last_name => 'Lennon')
      ),
      stub_model(Charge,
        :created => "2010-01-20 10:43:39",
        :paid => true,
        :amount => 1.5,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'Paul', :last_name => 'McCartney')
      ),
      stub_model(Charge,
        :created => "1990-01-17 19:43:58",
        :paid => true,
        :amount => 2,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'Jimmy', :last_name => 'Falcon')
      ),
      stub_model(Charge,
        :created => "1999-01-17 07:20:31",
        :paid => true,
        :amount => 2.5,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'Randy', :last_name => 'Savage')
      ),
      stub_model(Charge,
        :created => "2015-01-17 01:13:02",
        :paid => true,
        :amount => 3,
        :currency => "usd",
        :refunded => false,
        :customer => stub_model(Customer, :first_name => 'Jon', :last_name => 'Jone')
      )
    ])
  end

  it "renders a header as Failed Charges" do
    render
    assert_select "h1", :text => "Failed Charges", :count => 1
  end

  it "renders a header as Disputed Charges" do
    render
    assert_select "h1", :text => "Disputed Charges", :count => 1
  end

  it "renders a header as Successful Charges" do
    render
    assert_select "h1", :text => "Successful Charges", :count => 1
  end

  it "renders 5 Failed Charges" do
    render
    assert_select ".failed", :count => 5
  end

  it "renders 5 Disputed Charges" do
    render
    assert_select ".disputed", :count => 5
  end

  it "renders 10 Successful Charges" do
    render
    assert_select ".successful", :count => 10
  end
end
