require 'spec_helper'

describe "charges/show" do
  before(:each) do
    @charge = assign(:charge, stub_model(Charge,
      :paid => false,
      :amount => 1.5,
      :currency => "Currency",
      :refunded => false,
      :customer_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Currency/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
  end
end
