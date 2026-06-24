// nested struct with optional primitive and defaulted string
struct InnerS {
  a: Int?;
  s: String = "hello";
}

struct OuterS {
  inner: InnerS;
  b: Bool;
}

contract NestedDefaultsStr {
  f: OuterS;
  init() {
    self.f = OuterS{
      inner: InnerS{ a: null, s: "override" },
      b: true,
    };
  }
}