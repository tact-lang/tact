struct MixPrimOpt {
  i: Int?;
  b: Bool?;
  s: String?;
}

struct OuterNest {
  a: MixPrimOpt;
  b: MixPrimOpt;
}

contract NestedMixedOptionals {
  val: OuterNest;

  init() {
    self.val = OuterNest{
      a: MixPrimOpt{ i: null, b: null, s: null },
      b: MixPrimOpt{ i: 1, b: true, s: "x" },
    };
  }
}
