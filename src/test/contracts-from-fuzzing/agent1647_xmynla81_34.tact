struct Foo {
  a: Int? = 42;
}
contract Test {
  data: Foo;
  init() {
    self.data = Foo{};
  }
}
