require 'securerandom'

def uuid
  SecureRandom.uuid
end

def random_date(previous_date = nil)
  from = previous_date || Time.new(1970, 1, 1)
  to = Time.now
  (Time.at(from + rand * (to.to_f - from.to_f)))
end

def date_to_s(date)
  date.to_s.gsub(' +','+')
end

def random_elem(list, i)
  list[i % list.length]
end

PHENOTYPES = 30.times.map{|i| "pheno#{i}"}
SANGERS = 30.times.map{|i| "sanger#{i}"}
GENDERS = ['male','female']

10000.times do |i|
  c_date = random_date
  u_date = random_date(c_date)
  r_date = random_elem([u_date, random_date(c_date)], i)

  created = date_to_s(c_date)
  updated = date_to_s(u_date)
  received = date_to_s(r_date)
  gender = random_elem(GENDERS, i)
  sanger = random_elem(SANGERS, i)
  phenotype = random_elem(PHENOTYPES, i)

  puts "INSERT INTO genders(gender) VALUES ('#{gender}');"
  puts ["INSERT INTO receptions_by_genders (gender_gender, received_at, sample_uuid, phenotype,",
    " sanger_sample_id, created_at, updated_at) VALUES ('#{gender}', '#{received}', #{uuid},",
    "'#{phenotype}', '#{sanger}', '#{created}', '#{updated}');"].join("")
  #puts ["INSERT INTO receptions_by_sample",
  #	"(uuid, received_at, reception_year, reception_month, reception_day, reception_hour, phenotype, created_at, sanger_sample_id) ",
	#{}"VALUES (#{uuid}, '#{reception.to_s.split(" ")[0]}', #{reception.year}, #{reception.month}, #{reception.day}, #{reception.hour}, ",
 	#{}"'#{phenotype(i)}', '#{created(i)}', '#{sanger(i)}');"].join('')
end
