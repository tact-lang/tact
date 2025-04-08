struct NestMix {
  a: Int;
  b: Bool?;
}

struct OuterMix {
  s: NestMix;
  c: Int?;
}

contract NestedMixOpt {
  f: OuterMix;

  init() {
    self.f = OuterMix{
      s: NestMix{ a:5, b: null },
      c: null
    };
  }
}
