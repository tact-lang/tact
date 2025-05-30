struct SDefault {
  a: Int = 0;
  b: String = "x";
}

struct NestedMix {
  first: SDefault;
  second: SDefault;
}

contract MixDefaults {
  data: NestedMix;

  init() {
    self.data = NestedMix{
      first: SDefault{},
      second: SDefault{}
    };
  }
}