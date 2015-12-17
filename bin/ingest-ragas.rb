require 'yaml'
require 'json'
require 'i18n'

h = YAML.load_file 'data/ragas.raw.yml'

last_melakarta = nil
swaras = YAML.load_file('swaras.yml').keys
puts swaras.inspect

out = Hash[
  h.map do |k, v|
    k =~ (/^[0-9]/) ? is_mel = true : is_mel = false
    name = k.gsub(/^\d+\s+/, '')
    I18n.available_locales = [:en]
    name_tr = I18n.transliterate(name)

    key_name = name_tr.
      downcase.
      tr('A-Z', 'a-z').
      gsub(/\(.*\)/, '').
      gsub(' ', '_').
      gsub(/_$/, '')

    last_melakarta = key_name if is_mel

    arohanams = v["Ascending Scale(ārohanam)"].split("\n")
    avarohanams = v["Descending Scale(Avarohanam)"].split("\n")

    puts v if arohanams.size != avarohanams.size

    # puts arohanams.inspect
    (arohanams + avarohanams).each do |scale|
      scale.split.each do |note|
         unless swaras.include? note
           puts "#{k} #{note}"
         end
      end
    end

    scales = arohanams.
      zip(avarohanams).
      map do |scale|
        Hash[
          ["arohanam", "avarohanam"].
            zip(scale)
        ]
      end

    raga = {'name' => name}
    raga.merge!('melakarta' => true) if is_mel
    raga.merge!('janya' => true) unless is_mel
    raga.merge!('derived_from' => last_melakarta) unless is_mel
    raga.merge!('scales' => scales)

    [key_name, raga]
  end
]

File.open('ragas.yml', 'w') { |f| f.write out.to_yaml }
File.open('ragas.json', 'w') { |f| f.write JSON.pretty_generate(out) }

