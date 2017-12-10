class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :city

  belongs_to :contact do#, optional:
    link(:related) { contact_address_url(object.contact.id) }
  end
end
