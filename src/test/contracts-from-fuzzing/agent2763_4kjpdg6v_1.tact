struct Nested {
  inner: InnerStruct;
  optInner: InnerStruct?;
}

struct InnerStruct {
  value: Int;
}

contract DeepOptionalNested {
  nested: Nested;

  init() {
    self.nested = Nested{
      inner: InnerStruct{value: 42},
      optInner: null,
    };
  }
}