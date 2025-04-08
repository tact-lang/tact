struct InnerOpt {
  a: Int?;
  b: String?;
}

struct OuterOpt {
  nested: InnerOpt?;
  c: Bool?;
}

contract Test {
  store: OuterOpt;

  init() {
    self.store = OuterOpt{
      nested: null,
      c: null
    };
  }

  receive() {
    self.store = OuterOpt{
      nested: InnerOpt{ a:1, b:"" },
      c: true
    };
  }
}
