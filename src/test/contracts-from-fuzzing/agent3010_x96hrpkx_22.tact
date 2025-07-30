struct Inner { val: Int; }

contract NestedStructOptField {
  foo: Inner?;

  init() {
    self.foo = Inner{ val: 77 };
  }
}