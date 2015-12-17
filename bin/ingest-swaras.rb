require 'yaml'

SWARAS = [
  { 'name' => 'Shadja (षड्ज)', 'shortname' => 'Sa', 'key' => 'S', 'note' => 'C', 'halfsteps' => 0 },
  { 'name' => 'Shuddha Rishabha (शुद्ध ऋषभ)', 'shortname' => 'Ri', 'key' => 'R1', 'note' => 'D♭', 'halfsteps' => 1 },
  { 'name' => 'Chatushruti Rishabha (चतुश्रुति ऋषभ)', 'shortname' => 'Ri', 'key' => 'R2', 'note' => 'D', 'halfsteps' => 2 },
  { 'name' => 'Shuddha Gandhara (शुद्ध गान्धार)', 'shortname' => 'Ga', 'key' => 'G1', 'note' => 'D', 'halfsteps' => 2 },
  { 'name' => 'Shatshruti Rishabha (षट्श्रति ऋषभ)', 'shortname' => 'Ri', 'key' => 'R3', 'note' => 'E♭', 'halfsteps' => 3 },
  { 'name' => 'Sadharana Gandhara (साधारण गान्धार)', 'shortname' => 'Ga', 'key' => 'G2', 'note' => 'E♭', 'halfsteps' => 3 },
  { 'name' => 'Antara Gandhara (अन्तर गान्धार)', 'shortname' => 'Ga', 'key' => 'G3', 'note' => 'E', 'halfsteps' => 4 },
  { 'name' => 'Shuddha Madhyama (शुद्ध मध्यम)', 'shortname' => 'Ma', 'key' => 'M1', 'note' => 'F', 'halfsteps' => 5 },
  { 'name' => 'Prati Madhyama (प्रति मध्यम)', 'shortname' => 'Ma', 'key' => 'M2', 'note' => 'F♯', 'halfsteps' => 6 },
  { 'name' => 'Panchama (पञ्चम)', 'shortname' => 'Pa', 'key' => 'P', 'note' => 'G', 'halfsteps' => 7 },
  { 'name' => 'Shuddha Dhaivata (शुद्ध धैवत)', 'shortname' => 'Dha', 'key' => 'D1', 'note' => 'A♭', 'halfsteps' => 8 },
  { 'name' => 'Chatushruti Dhaivata (चतुश्रति धैवत)', 'shortname' => 'Dha', 'key' => 'D2', 'note' => 'A', 'halfsteps' => 9 },
  { 'name' => 'Shuddha Nishada (शुद्ध निषाद)', 'shortname' => 'Ni', 'key' => 'N1', 'note' => 'A', 'halfsteps' => 9 },
  { 'name' => 'Shatshruti Dhaivata (षट्श्रुति धैवत)', 'shortname' => 'Dha', 'key' => 'D3', 'note' => 'B♭', 'halfsteps' => 10 },
  { 'name' => 'Kaisiki Nishada (कैशिकी निषाद)', 'shortname' => 'Ni', 'key' => 'N2', 'note' => 'B♭', 'halfsteps' => 10 },
  { 'name' => 'Kakali Nishada (काकली निषाद)', 'shortname' => 'Ni', 'key' => 'N3', 'note' => 'B', 'halfsteps' => 11 },
]

KEY2SWARA = Hash[
  SWARAS.map do |swara_hash|
    key = swara_hash['key']
    value = {
      'name' => swara_hash['name'].gsub(/\s*\(.+\)/, ''),
      'sanskrit_name' => swara_hash['name'].gsub(/^.*\(/, '').gsub(/\)$/, ''),
      'shortname' => swara_hash['shortname'],
      'key' => swara_hash['key'],
      'note' => swara_hash['note'],
      'halfsteps' => swara_hash['halfsteps']
    }
    [key, value]
  end
]

File.open('swaras.yml', 'w') { |f| f.write KEY2SWARA.to_yaml; puts KEY2SWARA.to_yaml }

