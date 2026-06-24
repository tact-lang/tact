struct InnerOpt {
  a: Int?;
}

struct OuterDef {
  inner: InnerOpt = InnerOpt{a: null};
  x: Int = 5;
}

contract Test {
    s: OuterDef;
    init() {
        self.s = OuterDef{};
    }
}