struct Complex {
  x: Int;
  y: Int?;
  z: Int;
}

struct Wrapper1 {
  c: Complex;
}
struct Wrapper2 {
  c: Complex?;
}

contract MixedWrapper {
  w1: Wrapper1;
  w2: Wrapper2;

  init() {
    self.w1 = Wrapper1{ c: Complex{ x:1, y:null, z:2 } };
    self.w2 = Wrapper2{ c: null };
  }
}