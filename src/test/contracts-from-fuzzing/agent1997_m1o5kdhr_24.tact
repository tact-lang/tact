struct MixedBits {
  a: Int as int3;
  b: Int as uint5;
  c: Int;
  d: Int as uint16;
}

contract BitWidths {
  val: MixedBits;

  init() {
    self.val = MixedBits{
      a: -1,
      b: 3,
      c: 1000000,
      d: 65535
    };
  }
}
