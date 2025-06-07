contract OptStructWithInnerOpt {
  s: OuterOpt?;
  init() {
    self.s = OuterOpt{
      nested: null
    };
  }
}

struct OuterOpt {
  nested: InnerOpt?;
}

struct InnerOpt {
  foo: Int?;
}