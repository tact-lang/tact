struct DeepNested {
  value: Int;
}

struct Nested {
  deep: DeepNested;
  optDeep: DeepNested?;
}

contract NestedStructContract {
  nested1: Nested;
  nested2: Nested?;

  init() {
    self.nested1 = Nested{
      deep: DeepNested{value: 1},
      optDeep: null
    };
    self.nested2 = null;
  }
}
