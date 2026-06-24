struct Foo {
  s: String? = "hi";
}
contract Test {
  data: Foo;
  init() {
    self.data = Foo{};
  }
}
