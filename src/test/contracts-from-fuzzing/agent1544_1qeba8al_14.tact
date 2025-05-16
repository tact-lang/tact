struct S {
  flag: Bool;
}

contract OptStruct {
  inner: S?;

  init() {
    self.inner = S{ flag: true };
  }
}
