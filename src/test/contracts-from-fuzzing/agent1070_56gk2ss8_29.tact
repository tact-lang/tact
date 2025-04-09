struct SubNest {
  a: Int;
  s: String?;
}

struct OuterNest {
  x: Int?;
  sub: SubNest;
}

contract DeepMix {
  data: OuterNest;

  init() {
    self.data = OuterNest{
      x: null,
      sub: SubNest{
        a: 22,
        s: null
      }
    };
  }
}