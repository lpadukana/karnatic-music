K2W = {
  S: "C",
  R1: "Cs", R2: "D", R3: "Ds",
  G1: "D", G2: "Ds", G3: "E",
  M1: "F", M2: "Fs",
  P: "G",
  D1: "Gs", D2: "A", D3: "As",
  N1: "A", N2: "As", N3: "B"
}

MALAHARI = {s: "s", r: "r1", g: "g3", m: "m1", p: "p", d: "d1"}
MAYA_MALAVA_GOWLA = {s: "s", r: "r1", g: "g3", m: "m1", p: "p", d: "d1", n: "n3"}

def k2w_map(n)
  note = n.split(/[\+-]/)[0]
  return note if note == ','
  
  octave = 3
  accent = n[-1]
  
  octave += 1 if accent == '+'
  octave -= 1 if accent == '-'
  
  K2W[note.upcase.to_sym] + octave.to_s
end

def to_scale(n, scale)
  note = n[0]
  return ',' if note == ','
  
  accent = n[-1]
  if accent != '+' && accent != '-'
    accent = ''
  end
  
  scale[note.to_sym] + accent
end

def play_karnatic(notes_in, scale_map)
  notes_in = notes_in.gsub("S", "s+")
  notes_in = notes_in.gsub("R", "r+")
  notes_in = notes_in.gsub("G", "g+")
  notes_in = notes_in.gsub("M", "m+")
  notes_in = notes_in.gsub("P", "p+")
  notes_in.split(' ').each_with_index do |n, i|
    next if n == '|' or n == '||'
    n_s = to_scale(n, scale_map)
    n_w = k2w_map(n_s)
    
    print notes_in.split()[i..i+8].join ' '
    print n, n_s, n_w
    
    if n_w != ','
      play n_w
    else
      print ""
    end
    
    sleep 0.5
  end
end


##| https://srika.in/chapter-2-madhyasthayi-varisai/
madhyasthayi_varisai = %{
  s r g m | p , | g m ||
  p , , , | p , | , , ||
  g m p d | n d | p m ||
  g m p g | m g | r s ||
  S , n d | n , | d p ||
  d , p m | p , | p , ||
  g m p d | n d | p m ||
  g m p g | m g | r s ||
  S S n d | n n | d p ||
  d d p m | p , | p , ||
  g m p d | n d | p m ||
  g m p g | m g | r s ||
  s r g r | g , | g m ||
  p m p , | d p | d , ||
  m p d p | d n | d p ||
  m p d p | m g | r s ||
  s r g m | p , | p , ||
  d d p , | m m | p , ||
  d n S , | S n | d p ||
  S n d p | m g | r s ||
}


use_synth :piano
##| use_synth :pluck
use_bpm 250
##| use_bpm 45

play_karnatic(madhyasthayi_varisai, MAYA_MALAVA_GOWLA)
