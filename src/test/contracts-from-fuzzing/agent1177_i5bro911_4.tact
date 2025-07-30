struct Deep3 {
  z: Int;
}

struct Deep2 {
  y: Deep3;
}

struct Deep1 {
  x: Deep2;
}

contract DeepNested {
  val: Deep1;

  init() {
    self.val = Deep1{ x: Deep2{ y: Deep3{ z: 99 } } };
  }
}
