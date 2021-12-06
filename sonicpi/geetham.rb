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
    n_s = to_scale(n, scale_map)
    n_w = k2w_map(n_s)
    
    print notes_in.split()[i..i+8].join ' '
    print n, n_s, n_w
    
    if n_w != ','
      play n_w
    end
    
    sleep 0.5
  end
end

geetham = %{
  m p d s+ s+ r+   r+ s+ d p m p
  r m p d  m  p    d  p  m g r s
  s , r m  g  r    s  r  g r s ,
  r m p d  m  p    d  p  m g r s
  s , r m  g  r    s  r  g r s ,
  
  m p d s+ s+ r+   r+ s+ d p m p
  r m p d  m  p    d  p  m g r s
  
  s , r m g r      s r g r s ,
  r m p d m p      d p m g r s
  s , r m g r      s r g r s ,
  
  m p d s+ s+ r+   r+ s+ d p m p
  r m p d m p      d  p  m g r s
  
  s , r m g r      s r g r s ,
  r m p d m p      d p m g r s
  s , r m g r      s r g r s ,
  
  d p  m  g  r s   r m p d m p
  d r+ r+ s+ d p   d p m g r s
  s ,  r  ,  r ,   d p m g r s
  s r  m  ,  g r   s r g r s ,
  
  d p  m  g  r s   r m p d m p
  d r+ r+ s+ d p   d p m g r s
  
  s , r , r ,      d p m g r s
  s r m , g r      s r g r s ,
  
  d p  m  g  r s   r m p d m p
  d r+ r+ s+ d p   d p m g r s
  
  s , r , r ,      d p m g r s
  s r m , g r      s r g r s ,
}

use_synth :piano
##| use_synth :pluck
use_bpm 100

play_karnatic(geetham, MALAHARI)
