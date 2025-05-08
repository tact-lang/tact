struct Base {
  i: Int;
}

struct Mid {
  b1: Base;
  b2: Base;
}

struct Outer {
  m1: Mid;
  m2: Mid;
}

contract Test {
  nested: Outer;

  init() {
    self.nested = Outer{
      m1:Mid{b1:Base{i:1},b2:Base{i:2}},
      m2:Mid{b1:Base{i:3},b2:Base{i:4}}
    };
  }
}