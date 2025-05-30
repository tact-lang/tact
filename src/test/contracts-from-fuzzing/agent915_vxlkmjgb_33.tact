struct Sizing {
  u4: Int as uint4;
  s16: Int as int16;
  co: Int as coins;
  normal: Int;
  b: Bool;
}

contract MixedSizes {
  d: Sizing;

  init() {
    self.d = Sizing{
      u4: 12, s16: -200, co: 1000, normal: -9, b: true
    };
  }
}
