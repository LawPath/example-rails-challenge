class HomeController < ApplicationController
  def index
    @failed_charges = Charge.where(:paid => false)
    @disputed_charges = Charge.where(:refunded => true)
    @successful_charges = Charge.where(:paid => true)
  end
end
