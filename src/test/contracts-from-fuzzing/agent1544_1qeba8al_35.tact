struct DefaultNested {
  one: Inner;
  two: Bool;
}

struct Inner {
  foo: Int = 10;
}

contract StructWithDefaultNested {
  val: DefaultNested;

  init() {
    self.val = DefaultNested{ one: Inner{}, two: true };
  }
}
