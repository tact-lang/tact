struct OptionalNest {
  foo: Int?;
  bar: NestedInner?;
}

struct NestedInner {
  baz: Bool?;
}

contract TestContract {
  data: OptionalNest;

  init() {
    self.data = OptionalNest{
      foo: null,
      bar: NestedInner{baz: null}
    };
  }
}
