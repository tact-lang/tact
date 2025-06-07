struct WrapStruct {
 nested: InnerStruct?;
}

struct InnerStruct {
  foo: Int;
  bar: Bool;
}

contract OptionalNestedStructField {
  data: WrapStruct;

  init() {
    self.data = WrapStruct{
      nested: InnerStruct{
        foo: 7,
        bar: true,
      },
    };
  }
}