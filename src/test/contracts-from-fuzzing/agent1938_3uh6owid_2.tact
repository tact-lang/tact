struct OptionalInner {
  foo: Int;
}

struct OptionalMiddle {
  bar: OptionalInner?;
}

contract NestedOptionalTest {
  data: OptionalMiddle;
  init() {
    self.data = OptionalMiddle{ bar: null };
  }
}