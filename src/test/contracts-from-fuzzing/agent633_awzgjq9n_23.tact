struct MixedPacking {
  a: Int as uint4;
  b: Bool;
  c: Int as uint4;
  d: Bool;
}

contract MixedPackingContract {
  data: MixedPacking;

  init() {
    self.data = MixedPacking{
      a: 15,
      b: true,
      c: 9,
      d: false
    };
  }
}
