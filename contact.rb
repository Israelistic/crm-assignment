#!/usr/bin/env ruby
require 'pry'
class Contact
@@contacts = []
@@next_id = 100
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note = 'N/A')
      @first_name = first_name
      @last_name = last_name
      @email = email
      @note = note
      @id = @@next_id
      @@next_id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note = 'N/A')
     display_contact = self.new(first_name, last_name, email, note = 'N/A')
     @@contacts << display_contact
     return display_contact
  end

  # This method should return all of the existing contacts
  def self.all
    return @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do | contact |
        if contact.id == id
          return contact
        end
     end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute,new_value)
    case attribute
    when "1"
      @first_name = new_value
    when "2"
      @last_name = new_value
    when "3"
      @email = new_value
    when "4"
      @note = new_value
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    case attribute
      when "1" then
        @@contacts.each do |contact| #binding.pry
          if contact.first_name.downcase == value.downcase
          return contact
          end
        end
      when "2" then
        @@contacts.each do |contact|
          if contact.last_name.downcase == value.downcase
          return contact
          end
      end
      when "3" then
        @@contacts.each do |contact|
          if contact.email.downcase == value.downcase
          return contact
          end
      end
      # when "4" then
      #   @@contacts.each do |contact|
      #     if contact.full_name(first_name, last_name).downcase == value.downcase
      #     return contact
      #     end
      #   end
      end
    end
  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.each { | contact |  contacts.delete_at(contact)}
  end

  def full_name(fist_name, last_name)
      return "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(contacts)
    @@contacts.delete(contact)
  end

  # Feel free to add other methods here, if you need them.
  #getter/reader
  def id
    return @id
  end

  def first_name
    return @first_name
  end

  def last_name
    return @last_name
  end

  def email
    return @email
  end

  def note
    return @note
  end
  def display_all_contacts
    return @contacts
  end

end


p Contact.create("Haggai", "Lerman","haggai@gmail.com")
p Contact.create("Daniel", "Moniz", "daniel@gmail.com")
puts
puts "===self.find==="
p Contact.find(100).update("email", "guyl@walla.co.il")
p Contact.find(100)




# puts "====SELF===="
