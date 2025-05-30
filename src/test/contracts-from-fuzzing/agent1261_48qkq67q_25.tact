struct Mix1 {
  a: Int;
  b: Int?;
}

struct Mix2 {
  c: Bool;
  d: Bool?;
}

contract CrossMix {
  m1: Mix1;
  m2: Mix2;

  init() {
    self.m1 = Mix1{ a: 1, b: null };
    self.m2 = Mix2{ c: true, d: null };
  }
}