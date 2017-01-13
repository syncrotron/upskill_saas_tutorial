class ContactMailer < ActionMailer::Base
    default to: 'hutsaetxea@gmail.com'
    
    def contact_email(name, email, comments)
        @name = name
        @email = email
        @comments = comments
        mail(from: email, subject: 'Contact Form Message')
    end
end
