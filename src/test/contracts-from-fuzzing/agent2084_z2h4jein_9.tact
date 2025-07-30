struct Foo {
  s: String;
  b: Bool?;
}

contract Test {
  val: Foo?;

  init() {
    self.val = Foo{
      s: "bar",
      b: null
    };
  }
}
