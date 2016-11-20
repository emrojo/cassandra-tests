class ReceptionsByGender
	include Cequel::Record
	belongs_to :gender

  key :received_at, :timestamp

  column :sample_uuid, :uuid
  column :phenotype, :text
  column :created_at, :timestamp
  column :updated_at, :timestamp
  column :sanger_sample_id, :text

end