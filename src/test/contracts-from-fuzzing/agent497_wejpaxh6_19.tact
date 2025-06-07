struct VariedSerialized {
  a: Int as uint4;
  b: Int as uint8;
  c: Int as int64;
  d: Int as uint128;
}

contract TestContract {
  vals: VariedSerialized;

  init() {
    self.vals = VariedSerialized{a:1,b:2,c:3,d:4};
  }
}