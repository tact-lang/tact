struct NestedOptWrapped {
  foo: Wrapped?;
}

struct Wrapped {
  bar: Int;
  baz: Bool;
}

contract TestContract {
  val: NestedOptWrapped;

  init() {
    self.val = NestedOptWrapped {
      foo: Wrapped{ bar: 1, baz: true }
    };
  }
}