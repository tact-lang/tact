struct OptionalNested {
  foo: Nested?;
}

struct Nested {
  bar: Int;
}

contract OptNestedContract {
  data: OptionalNested;

  init() {
    self.data = OptionalNested{
      foo: null
    };
  }
}
