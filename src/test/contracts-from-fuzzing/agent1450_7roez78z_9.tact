struct ComboNested {
  flag: Bool;
  nestedOpt: InnerOpt?;
}

struct InnerOpt {
  foo: Int;
  bar: Bool;
}

contract NestedOptionalTest {
  entry: ComboNested;

  init() {
    self.entry = ComboNested{
      flag: true,
      nestedOpt: InnerOpt{
        foo: 10,
        bar: false,
      },
    };
  }
}