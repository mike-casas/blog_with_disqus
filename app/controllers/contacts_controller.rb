class ContactsController < ApplicationController
  def new
    @contact= Contact.new
  end
  def create
    @contact_form = Contact.new(params[:contact])
    @contact_form.request = request
    if @contact_form.deliver
      flash.now[:error]=nil
    else
      flash.now[:error]= "can't send message"
      render new
    end
  end
end
