struct OptionalNest {
  inner: InnerOption?;
}

struct InnerOption {
  x: Int;
  s: String;
}

contract OptionalInStruct {
  f1: OptionalNest = OptionalNest{inner: null};

  init() {
    self.f1 = OptionalNest{inner: InnerOption{x: 5, s: "hi"}};
  }
}
