class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones
  def birthdate_br
    I18n.l(self.birthdate) unless self.birthdate.blank?
  end

  def to_br
    {
        name: self.name,
        email: self.email,
        birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
    }
  end

  def as_json(options={})
    h = super(options)
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    h
  end

  '''def author
    return "Caio Câmara"
  end
  def kind_description
    return self.kind.description
  end
  def as_json(options={})
    super(methods: [:author, :kind_description],
          root: true,
          include: :kind,
          #include: {kind: {only: :description}}
          )
  end'''
  #def hello
  #  I18n.t('hello')
  #end
  #def i18n
  #  I18n.default_locale
  #end

end
