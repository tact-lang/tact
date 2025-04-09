struct Deep3 {
  x: Int;
}

struct Deep2 {
  y: Deep3;
}

struct Deep1 {
  z: Deep2;
}

contract VeryNested {
  data: Deep1;

  init() {
    self.data = Deep1{ z: Deep2{ y: Deep3{ x: 99 } } };
  }
}
