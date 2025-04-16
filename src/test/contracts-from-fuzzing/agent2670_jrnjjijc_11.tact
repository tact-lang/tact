struct SerializeVariants {
  a: Int as uint8;
  b: Int as int16;
  c: Int as uint32;
  d: Int as int64;
}

contract SerializedInts {
  s: SerializeVariants;

  init() {
    self.s = SerializeVariants{
      a: 1,
      b: -2,
      c: 3,
      d: -4
    };
  }
}