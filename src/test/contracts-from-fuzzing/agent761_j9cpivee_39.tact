struct SomeNested {
  a: Int;
  b: Bool;
}

contract OptionalStructInside {
  foo: SomeNested?;

  init() {
    self.foo = SomeNested{ a: 1, b: true };
  }
}