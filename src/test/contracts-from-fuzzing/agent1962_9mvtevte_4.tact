struct DeepNested {
  foo: Int;
  child: NestedLevel;
}

struct NestedLevel {
  bar: Int;
  inner: InnerMost;
}

struct InnerMost {
  baz: String;
  flag: Bool;
}

contract TestDeep {
  data: DeepNested;

  init() {
    self.data = DeepNested{
      foo: 1,
      child: NestedLevel{
        bar: 2,
        inner: InnerMost{ baz: "test", flag: true }
      }
    };
  }
}
