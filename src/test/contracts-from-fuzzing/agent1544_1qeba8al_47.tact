struct Inner {
  foo: Int? = null;
}

contract DefaultOptionalStruct {
  s: Inner;

  init() {
    self.s = Inner{};
  }
}
