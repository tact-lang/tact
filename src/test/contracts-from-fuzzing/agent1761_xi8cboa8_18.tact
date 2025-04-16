struct IntBoolMix {
  count: Int;
  enabled: Bool;
  threshold: Int?;
  flag: Bool;
}

contract IntBoolMixTest {
  s: IntBoolMix;

  init() {
    self.s = IntBoolMix{
      count: 5,
      enabled: true,
      threshold: null,
      flag: false
    };
  }
}