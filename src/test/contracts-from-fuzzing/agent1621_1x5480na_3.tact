struct Deep {
  a: Int;
  b: Int?;
}

struct Mid {
  d: Deep;
  flag: Bool;
}

contract DeepNested {
  m: Mid;

  init() {
    self.m = Mid{ d: Deep{ a: 1, b: null }, flag: true };
  }
}