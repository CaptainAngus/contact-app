class Api::V1::ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  def index
    @contacts = Contact.all
    render json: @contacts
  end

  def new
    @contact = Contact.new
  end

  def create
    body = JSON.parse(request.body.read)
    @contact = Contact.new(body)
    @contact.save!
    render json: @contacts
  end

  # def destroy
  #   @contact.destroy
  # end

  def contact_params
    params.require(:contact).permit(:firstName, :lastName, :emailAddress, :phoneNumber, :companyName)
  end
end
