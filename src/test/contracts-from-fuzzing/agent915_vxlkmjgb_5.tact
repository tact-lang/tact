struct OptionalStruct {
  foo: Int?;
  bar: Bool?;
  baz: String?;
}

struct Wrapper {
  content: OptionalStruct;
  value: Int;
}

contract OptionalInsideNested {
  store: Wrapper;

  init() {
    self.store = Wrapper{
      content: OptionalStruct{
        foo: null,
        bar: null,
        baz: null
      },
      value: 55
    };
  }
}
