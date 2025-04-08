struct OptionalBoolMix {
  flag1: Bool?;
  flag2: Bool;
  flag3: Bool?;
  flag4: Bool;
}

contract BoolMixTest {
  data: OptionalBoolMix;

  init() {
    self.data = OptionalBoolMix{
      flag1: null,
      flag2: true,
      flag3: null,
      flag4: false
    };
  }
}