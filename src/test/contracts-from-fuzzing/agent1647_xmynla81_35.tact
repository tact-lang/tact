struct Foo {
  b: Bool? = true;
}
contract Test {
  data: Foo;
  init() {
    self.data = Foo{};
  }
}
