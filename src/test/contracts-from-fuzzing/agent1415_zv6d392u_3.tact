struct NestedOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

struct DeepNested {
  foo: Int;
  bar: NestedOptionals;
}

contract TestContract {
  deep: DeepNested;

  init() {
    self.deep = DeepNested{
      foo: 1,
      bar: NestedOptionals{
        a: 2,
        b: false,
        c: "text",
        d: null,
      },
    };
  }
}