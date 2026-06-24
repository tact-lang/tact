struct Tiny {
  a: Int as int1;
  b: Int as uint3;
  c: Int as int5;
  d: Int as uint4;
}

contract Test {
  data: Tiny;

  init() {
    self.data = Tiny{a:1, b:7, c:-15, d:15};
  }
}
