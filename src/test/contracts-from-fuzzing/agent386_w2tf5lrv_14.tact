struct Boo {
  x: Int;
  y: String;
}

contract Defaulted {
  foo: Int = 100;
  bar: String = "str";
  baz: Boo = Boo{x: 1, y: "hello"};

  init() {
    self.foo = 42;
    self.bar = "changed";
    self.baz = Boo{x: 99, y: "world"};
  }
}
