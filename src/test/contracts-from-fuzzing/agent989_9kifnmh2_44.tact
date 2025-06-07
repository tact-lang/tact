struct Bar {
  b:Int;
}

contract FieldAfterInit {
  foo: Int;
  bar: Bar;

  init() {
    self.foo = 1;
    self.bar = Bar{ b: 2 };
  }
}