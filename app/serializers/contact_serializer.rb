class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate#, :author

  belongs_to :kind do#, optional:
    link(:related) { contact_kind_url(object.id) }
  end

  has_many :phones do
    link(:related) { contact_phones_url(object.id) }
  end
  has_one :address

  #def author
  #  "Caio Câmara"
  #end
  meta do
    { author: "Caio Câmara"}
  end
  #link(:self) { contact_path(object.id) }
  #link(:kind) { kind_path(object.kind.id) }

  #link(:self) { contact_url(object.id) }
  #link(:kind) { kind_url(object.kind.id) }

  def attributes(*args)
    h = super(*args)
    # h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end

end
