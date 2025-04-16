struct DeepMix {
  a: Int;
  b: OptInner?;
  c: DeepInner;
}

struct OptInner {
  foo: Int?;
}

struct DeepInner {
  x: Int;
  y: Int;
}

contract MixTest {
  f: DeepMix;

  init() {
    self.f = DeepMix{
      a: 1,
      b: OptInner{ foo: null },
      c: DeepInner{ x: 2, y: 3 }
    };
  }
}