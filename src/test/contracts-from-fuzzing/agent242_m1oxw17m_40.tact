struct DefaultsMix {
  i1: Int = 10;
  i2: Int = 20;
  o1: Int?;
  o2: Bool?;
}

contract DefaultsMixTest {
  data: DefaultsMix;

  init() {
    self.data = DefaultsMix{
      o1: null,
      o2: null,
    };
  }
}