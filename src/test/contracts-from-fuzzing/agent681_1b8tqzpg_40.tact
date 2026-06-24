struct S {
  foo: Int;
}

contract DefNullNested {
  opt: S? = null;

  init() {
    self.opt = null;
  }
}