struct InnerS {
  a: Int?;
}
struct MiddleS {
  b: Bool?;
  inner: InnerS;
}
struct OuterS {
  c: String;
  middle: MiddleS;
}

contract MixDeep {
  storage: OuterS;
  init() {
    self.storage = OuterS{
      c: "str",
      middle: MiddleS{ b: null, inner: InnerS{ a: null } },
    };
  }
}