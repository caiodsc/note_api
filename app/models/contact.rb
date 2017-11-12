class Contact < ApplicationRecord
  belongs_to :kind, optional: true

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
end
