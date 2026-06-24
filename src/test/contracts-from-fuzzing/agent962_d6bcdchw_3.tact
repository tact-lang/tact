struct Deep1 { x: Int; }
struct Deep2 { y: Deep1; }
struct Deep3 { z: Deep2; }

contract TestDepth {
  data: Deep3;

  init() {
    self.data = Deep3{ z: Deep2{ y: Deep1{ x: 123 } } };
  }
}