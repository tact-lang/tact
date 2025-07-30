struct WithStruct {
  nested: Nested;
}

struct Nested {
  inner: Inner;
}

struct Inner {
  value: Int;
}

contract DeepNestedStructFields {
  state: WithStruct;

  init() {
    self.state = WithStruct{
      nested: Nested{
        inner: Inner{ value: 42 }
      }
    };
  }
}