struct MixNested {
  inner: InnerOpt;
  value: Int;
}

struct InnerOpt {
  flag: Bool?;
  count: Int?;
}

contract MixTest {
  storage: MixNested;

  init() {
    self.storage = MixNested{
      inner: InnerOpt{ flag: null, count: 5 },
      value: 10
    };
  }
}