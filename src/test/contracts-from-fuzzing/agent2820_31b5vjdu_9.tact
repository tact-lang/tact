struct Sub {
  a: Int as uint8;
  b: Int as int64;
}

struct Top {
  part: Sub;
  x: Int as uint32;
}

contract NestedSerialization {
  d: Top;

  init() {
    self.d = Top{
      part: Sub{a: 15, b: -123456},
      x: 1000
    };
  }
}