struct S1 { x: Int; }
struct S2 { y: S1; }
struct S3 { z: S2; }
struct S4 { q: S3; }
struct S5 { r: S4; }

contract DeepChain {
  s: S5;

  init() {
    self.s = S5{ r: S4{ q: S3{ z: S2{ y: S1{ x: 123 } } } } };
  }
}