struct Inner {
  foo: Int;
}

struct Outer {
  field: Inner?;
}

contract NestedOptionalStruct {
  s: Outer;

  init() {
    self.s = Outer{ field: Inner{ foo: 123 } };
  }
}