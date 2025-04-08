struct Foo {
  a: Int? = 5;
}

contract Test {
  f: Foo;

  init() {
    self.f = Foo{};
  }
}