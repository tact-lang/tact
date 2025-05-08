struct Nested {
  a: Int;
  b: Bool;
  c: String;
}

struct Container {
  inner: Nested;
  optionalInner: Nested?;
}

contract DeepNestedOptional {
  field: Container;

  init() {
    self.field = Container{
      inner: Nested{ a: 1, b: true, c: "ok" },
      optionalInner: null
    };
  }
}