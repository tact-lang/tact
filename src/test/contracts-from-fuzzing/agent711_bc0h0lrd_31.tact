struct LargePacked {
  a: Int as uint256;
  b: Int as uint128;
  c: Int as uint64;
  d: Int as uint32;
  e: Int as uint16;
  f: Int as uint8;
  g: Int as uint4;
}

contract PackedSizes {
  state: LargePacked;

  init() {
    self.state = LargePacked{
      a: 1,
      b: 2,
      c: 3,
      d: 4,
      e: 5,
      f: 6,
      g: 7
    };
  }
}
