struct S {
  a: Int;
}

contract OptionalStructVarTest {
  inner: S?;

  init() {
    self.inner = S{a:1};
  }
}