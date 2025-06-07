struct ChainA { x: Int; }
struct ChainB { y: ChainA; }
struct ChainC { z: ChainB; }

struct Wrapper1 { a: ChainA; }
struct Wrapper2 { b: ChainB; }
struct Wrapper3 { c: ChainC; }

contract MixWrap {
  w1: Wrapper1;
  w2: Wrapper2;
  w3: Wrapper3;

  init() {
    self.w1 = Wrapper1{ a: ChainA{ x: 1 } };
    self.w2 = Wrapper2{ b: ChainB{ y: ChainA{ x: 2 } } };
    self.w3 = Wrapper3{ c: ChainC{ z: ChainB{ y: ChainA{ x: 3 } } } };
  }
}
