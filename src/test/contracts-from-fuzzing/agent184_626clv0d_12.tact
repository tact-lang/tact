struct Leaf {
  x: Int;
}

struct Inner {
  leaf: Leaf?;
}

struct Outer {
  maybeInner: Inner?;
}

contract DoubleNestedOptional {
  data: Outer;

  init() {
    self.data = Outer{ maybeInner: Inner{ leaf: null } };
  }
}
