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


##| https://www.karnatik.com/lesson2.shtml
janta_varis = %{
  s s r r | g g | m m ||
  p p d d | n n | s+ s+ ||
  s+ s+ n n | d d | p p ||
  m m g g | r r | s s ||
  
  s s r r | g g | m m ||
  r r g g | m m | p p ||
  g g m m | p p | d d ||
  m m p p | d d | n n ||
  p p d d | n n | s+ s+ ||
  s+ s+ n n | d d | p p ||
  n n d d | p p | m m ||
  d d p p | m m | g g ||
  p p m m | g g | r r ||
  m m g g | r r | s s ||
  
  s s r r | g g | r r ||
  s s r r | g g | m m ||
  r r g g | m m | g g ||
  r r g g | m m | p p ||
  g g m m | p p | m m ||
  g g m m | p p | d d ||
  m m p p | d d | p p ||
  m m p p | d d | n n ||
  p p d d | n n | d d ||
  p p d d | n n | s+ s+ ||
  s+ s+ n n | d d | n n ||
  s+ s+ n n | d d | p p ||
  n n d d | p p | d d ||
  n n d d | p p | m m ||
  d d p p | m m | p p ||
  d d p p | m m | g g ||
  p p m m | g g | m m ||
  p p m m | g g | r r ||
  m m g g | r r | g g ||
  m m g g | r r | s s ||
  
  s s r s | s r | s r ||
  s s r r | g g | m m ||
  r r g r | r g | r g ||
  r r g g | m m | p p ||
  g g m g | g m | g m ||
  g g m m | p p | d d ||
  m m p m | m p | m p ||
  m m p p | d d | n n ||
  p p d p | p d | p d ||
  p p d d | n n | s+ s+ ||
  s+ s+ n s+ | s+ n | s+ n ||
  s+ s+ n n | d d | p p ||
  n n d n | n d | n d ||
  n n d d | p p | m m ||
  d d p d | d p | d p ||
  d d p p | m m | g g ||
  p p m p | p m | p m ||
  p p m m | g g | r r ||
  m m g m | m g | m g ||
  m m g g | r r | s s ||
  
  s s r r | g s | r g ||
  s s r r | g g | m m ||
  r r g g | m r | g m ||
  r r g g | m m | p p ||
  g g m m | p g | m p ||
  g g m m | p p | d d ||
  m m p p | d m | p d ||
  m m p p | d d | n n ||
  p p d d | n p | d n ||
  p p d d | n n | s+ s+ ||
  s+ s+ n n | d s+ | n d ||
  s+ s+ n n | d d | p p ||
  n n d d | p n | d p ||
  n n d d | p p | m m ||
  d d p p | m d | p m ||
  d d p p | m m | g g ||
  p p m m | g p | m g ||
  p p m m | g g | r r ||
  m m g g | r m | g r ||
  m m g g | r r | s s ||
  
  s s , r | r , | g g ||
  s s r r | g g | m m ||
  r r , g | g , | m m ||
  r r g g | m m | p p ||
  g g , m | m , | p p ||
  g g m m | p p | d d ||
  m m , p | p , | d d ||
  m m p p | d d | n n ||
  p p , d | d , | n n ||
  p p d d | n n | s+ s+ ||
  s+ s+ , n | n , | d d ||
  s+ s+ n n | d d | p p ||
  n n , d | d , | p p ||
  n n d d | p p | m m ||
  d d , p | p , | m m ||
  d d p p | m m | g g ||
  p p , m | m , | g g ||
  p p m m | g g | r r ||
  m m , g | g , | r r ||
  m m g g | r r | s s ||
  
  s , s r | , r | g g ||
  s s r r | g g | m m ||
  r , r g | , g | m m ||
  r r g g | m m | p p ||
  g , g m | , m | p p ||
  g g m m | p p | d d ||
  m , m p | , p | d d ||
  m m p p | d d | n n ||
  p , p d | , d | n n ||
  p p d d | n n | s+ s+ ||
  s+ , s+ n | , n | d d ||
  s+ s+ n n | d d | p p ||
  n , n d | , d | p p ||
  n n d d | p p | m m ||
  d , d p | , p | m m ||
  d d p p | m m | g g ||
  p , p m | , m | g g ||
  p p m m | g g | r r ||
  m , m g | , g | r r ||
  m m g g | r r | s s ||
  
  s s s r | r r | g g ||
  s s r r | g g | m m ||
  r r r g | g g | m m ||
  r r g g | m m | p p ||
  g g g m | m m | p p ||
  g g m m | p p | d d ||
  m m m p | p p | d d ||
  m m p p | d d | n n ||
  p p p d | d d | n n ||
  p p d d | n n | s+ s+ ||
  s+ s+ s+ n | n n | d d ||
  s+ s+ n n | d d | p p ||
  n n n d | d d | p p ||
  n n d d | p p | m m ||
  d d d p | p p | m m ||
  d d p p | m m | g g ||
  p p p m | m m | g g ||
  p p m m | g g | r r ||
  m m m g | g g | r r ||
  m m g g | r r | s s ||
  
  s , r g | , s | r g ||
  s s r r | g g | m m ||
  r , g m | , r | g m ||
  r r g g | m m | p p ||
  g , m p | , g | m p ||
  g g m m | p p | d d ||
  m , p d | , m | p d ||
  m m p p | d d | n n ||
  p , d n | , p | d n ||
  p p d d | n n | s+ s+ ||
  s+ , n d | , s+ | n d ||
  s+ s+ n n | d d | p p ||
  n , d p | , n | d p ||
  n n d d | p p | m m ||
  d , p m | , d | p m ||
  d d p p | m m | g g ||
  p , m g | , p | m g ||
  p p m m | g g | r r ||
  m , g r | , m | g r ||
  m m g g | r r | s s ||
  
  s r , g | , s | r g ||
  s s r r | g g | m m ||
  r g , m | , r | g m ||
  r r g g | m m | p p ||
  g m , p | , g | m p ||
  g g m m | p p | d d ||
  m p , d | , m | p d ||
  m m p p | d d | n n ||
  p d , n | , p | d n ||
  p p d d | n n | s+ s+ ||
  s+ n , d | , s+ | n d ||
  s+ s+ n n | d d | p p ||
  n d , p | , n | d p ||
  n n d d | p p | m m ||
  d p , m | , d | p m ||
  d d p p | m m | g g ||
  p m , g | , p | m g ||
  p p m m | g g | r r ||
  m g , r | , m | g r ||
  m m g g | r r | s s ||
  
  s , r , | g s | r g ||
  s s r r | g g | m m ||
  r , g , | m r | g m ||
  r r g g | m m | p p ||
  g , m , | p g | m p ||
  g g m m | p p | d d ||
  m , p , | d m | p d ||
  m m p p | d d | n n ||
  p , d , | n p | d n ||
  p p d d | n n | s+ s+ ||
  s+ , n , | d s+ | n d ||
  s+ s+ n n | d d | p p ||
  n , d , | p n | d p ||
  n n d d | p p | m m ||
  d , p , | m d | p m ||
  d d p p | m m | g g ||
  p , m , | g p | m g ||
  p p m m | g g | r r ||
  m , g , | r m | g r ||
  m m g g | r r | s s ||
  
  s s m m | g g | r r ||
  s s r r | g g | m m ||
  r r p p | m m | g g ||
  r r g g | m m | p p ||
  g g d d | p p | m m ||
  g g m m | p p | d d ||
  m m n n | d d | p p ||
  m m p p | d d | n n ||
  p p s+ s+ | n n | d d ||
  p p d d | n n | s+ s+ ||
  s+ s+ p p | d d | n n ||
  s+ s+ n n | d d | p p ||
  n n m m | p p | d d ||
  n n d d | p p | m m ||
  d d g g | m m | p p ||
  d d p p | m m | g g ||
  p p r r | g g | m m ||
  p p m m | g g | r r ||
  m m s s | r r | g g ||
  m m g g | r r | s s ||
  
}

use_synth :piano
##| use_synth :pluck
##| use_bpm 100
use_bpm 200
##| use_bpm 45

play_karnatic(janta_varis, MAYA_MALAVA_GOWLA)
