struct OptionalNested {
  inner: Int?;
  another: Bool;
}

struct HasOptional {
  opt: OptionalNested;
}

contract NestedOptionals {
  storage: HasOptional;

  init() {
    self.storage = HasOptional{
      opt: OptionalNested{
        inner: null,
        another: false
      }
    };
  }
}