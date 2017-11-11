class Contact < ApplicationRecord
  def author
      return 'Caio Câmara'
  end

  def as_json(options={})
    super(methods: :author, root: true)
  end
end
