struct NullableNested {
  inner: Nested?;
}

struct Nested {
  foo: Bool?;
}

contract NullableNestedContract {
  val: NullableNested;

  init() {
    self.val = NullableNested{
      inner: null
    };
  }
}
