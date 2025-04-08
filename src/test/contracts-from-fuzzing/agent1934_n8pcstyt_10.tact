struct Packed {
  a: Int as int8;
  b: Int as uint4;
  c: Int as int1;
  d: Int as uint1;
}

contract TinySerialized {
  p: Packed;

  init() {
    self.p = Packed{
      a: -5,
      b: 8,
      c: -1,
      d: 1,
    };
  }
}
