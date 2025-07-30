struct NestedOptionals {
  a: Int?;
  inner: Inner?;
}

struct Inner {
  b: Int?;
  c: String?;
}

contract Test {
  v: NestedOptionals;
  init() {
    self.v = NestedOptionals{
      a: null,
      inner: null
    };
  }
}