struct InnerOpt {
  foo: Int?;
}

struct OuterOpt {
  inner: InnerOpt?;
}

contract OptionalInnerField {
  store: OuterOpt;

  init() {
    self.store = OuterOpt{inner: null};
  }
}