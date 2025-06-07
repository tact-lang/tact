struct Inner {
  a: Int;
  b: Int;
}

struct Outer {
  nested: Inner;
}

contract NestedDefaults {
  field: Outer = Outer{ nested: Inner{ a: 1, b: 2 } };

  init() {
    // only assign top, not nested inner explicitly
  }
}