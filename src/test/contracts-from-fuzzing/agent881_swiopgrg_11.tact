struct Outer {
  a: Int;
  b: String;
}

contract CrossRefInit {
  foo: Outer;
  bar: Int;

  init() {
    self.foo = Outer{
      a: 7,
      b: "hi"
    };
    self.bar = self.foo.a + 10;
  }
}