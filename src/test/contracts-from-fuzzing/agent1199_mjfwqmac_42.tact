struct Tiny {
  a: Int as uint4;
  b: Int as uint3;
  c: Int as int6;
}

contract Test42 {
  t: Tiny;

  init() {
    self.t = Tiny{a: 5, b: 3, c: -3};
  }
}