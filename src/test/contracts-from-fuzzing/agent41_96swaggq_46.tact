struct DeepComposed {
  s1: S1;
  s2: S2;
}

struct S1 {
  a: Int;
}

struct S2 {
  b: Bool;
}

contract ComposeDeep {
  cc: DeepComposed;

  init() {
    self.cc = DeepComposed{
      s1: S1{ a: 5 },
      s2: S2{ b: true }
    };
  }
}
