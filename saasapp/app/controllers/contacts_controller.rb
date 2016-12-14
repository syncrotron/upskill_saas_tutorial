class ContactsController < ApplicationController
  
  def new
    #creates a blank object
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:body]
      ContactMailer.contact_email(name, email, body).deliver
      flash[:success] = "Message Sent!"
      redirect_to new_contact_path
    else
      #gets errors thrown by ruby and forms english error warnings 
      #into an array that is then joined to one string
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  
  private 
  def contact_params
    params.require(:contact).permit(:name, :email, :comments)
  end
  
end
