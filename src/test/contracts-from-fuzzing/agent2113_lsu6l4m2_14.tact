struct InnerS {
  a: Int;
}

contract DefaultInitInner_struct {
  inner: InnerS;

  init() {
    self.inner = InnerS { a: 99 };
  }
}