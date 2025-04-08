struct Foo {
  a: Int;
}

contract PersistDefaultOpt {
  f: Foo? = null;

  init() {
    self.f = null;
  }
}