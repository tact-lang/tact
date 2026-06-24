struct Deep3 {
  z: Int;
}

struct Deep2 {
  y: Deep3;
}

struct Deep1 {
  x: Deep2;
}

contract TestContract {
  nested: Deep1;

  init() {
    self.nested = Deep1{ x: Deep2{ y: Deep3{ z: 42 } } };
  }
}