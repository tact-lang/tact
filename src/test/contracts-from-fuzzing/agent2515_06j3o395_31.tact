struct InnerMix {
  a: Int = 1;
  b: Bool = false;
}

struct OuterMix {
  im: InnerMix;
  x: Int = 5;
}

contract MixOverride {
  data: OuterMix;

  init() {
    self.data = OuterMix{
      im: InnerMix{a:42, b:true},
      x:100
    };
  }
}
