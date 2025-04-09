struct Numbers {
  a: Int as uint32;
  b: Int as uint8;
  c: Int;
  d: Int as int64;
}

contract MixedIntSizes {
  data: Numbers;

  init() {
    self.data = Numbers{a:1, b:2, c:3, d:4};
  }
}