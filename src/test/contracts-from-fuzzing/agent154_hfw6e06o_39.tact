struct DeepMix {
  a: Int;
  b: Mid1;
  c: Mid2;
}

struct Mid1 {
  x: Int?;
  y: Leaf1?;
}

struct Mid2 {
  p: Bool;
  q: Leaf2;
}

struct Leaf1 {
  z: Int;
}

struct Leaf2 {
  r: Bool?;
}

contract DeepMixContract {
  data: DeepMix;

  init() {
    self.data = DeepMix{
      a: 99,
      b: Mid1 { x: null, y: null },
      c: Mid2 { p: true, q: Leaf2{r:null} }
    };
  }
}