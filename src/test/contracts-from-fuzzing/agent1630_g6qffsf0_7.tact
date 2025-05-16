struct InnerMost {
  value: String;
}

struct Inner {
  nested: InnerMost;
}

struct Outer {
  nested: Inner;
}

contract DeepNestedField {
  data: Outer;

  init() {
    self.data = Outer{ nested: Inner{ nested: InnerMost{ value: "ok" } } };
  }
}