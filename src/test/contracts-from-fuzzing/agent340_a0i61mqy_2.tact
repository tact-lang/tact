struct DeepNested {
  inner: Nested;
}

struct Nested {
  value: InnerMost;
}

struct InnerMost {
  num: Int;
  flag: Bool;
}

contract TestDeepNested {
  data: DeepNested;
  init() {
    self.data = DeepNested{
      inner: Nested{
        value: InnerMost{ num: 42, flag: false }
      }
    };
  }
}