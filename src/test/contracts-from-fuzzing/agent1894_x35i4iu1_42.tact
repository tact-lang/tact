struct Base {
  a: Int;
}

struct Mid {
  left: Base;
  right: Base;
}

struct Top {
  m1: Mid;
  m2: Mid;
}

contract TreeStorage {
  root: Top;

  init() {
    self.root = Top{
      m1: Mid{ left: Base{a:1}, right: Base{a:2}},
      m2: Mid{ left: Base{a:3}, right: Base{a:4}},
    };
  }
}