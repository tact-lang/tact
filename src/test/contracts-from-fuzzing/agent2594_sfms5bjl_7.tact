struct OptDeep {
  a: Int?;
  inner: Nested?;
}

struct Nested {
    x: Int;
    y: Int?;
}

contract NestedOptionalFields {
  record: OptDeep;

  init() {
    self.record = OptDeep{
      a: null,
      inner: null
    };
  }
}