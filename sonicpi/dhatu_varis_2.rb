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


dhatu_varis = %{
  s m g r | s r | g m ||
  r p m g | r g | m p ||
  g d p m | g m | p d ||
  m n d p | m p | d n ||
  p s n d | p d | n s ||
  S p d n | S n | d p ||
  n m p d | n d | p m ||
  d g m p | d p | m g ||
  p r g m | p m | g r ||
  m s r g | m g | r s ||
  
  s m g m | r g | s r ||
  s g r g | s r | g m ||
  r p m p | g m | r g ||
  r m g m | r g | m p ||
  g d p d | m p | g m ||
  g p m p | g m | p d ||
  m n d n | p d | m p ||
  m d p d | m p | d n ||
  p S n S | d n | p d ||
  p n d n | p d | n S ||
  S p d p | n d | S n ||
  S d n d | S n | d p ||
  n m p m | d p | n d ||
  n p d p | n d | p m ||
  d g m g | p m | d p ||
  d m p m | d p | m g ||
  p r g r | m g | p m ||
  p g m g | p m | g r ||
  m s r s | g r | m g ||
  m r g r | m g | r s ||
}


use_synth :piano
##| use_synth :pluck
use_bpm 100
##| use_bpm 45

play_karnatic(dhatu_varis, MAYA_MALAVA_GOWLA)
