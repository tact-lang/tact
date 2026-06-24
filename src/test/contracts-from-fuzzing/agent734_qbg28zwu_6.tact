struct NestedOptional {
  foo: Int?;
  bar: Bool?;
  nested: InnerStruct?;
}

struct InnerStruct {
  s: String;
  b: Bool;
}

contract TestContract {
  data: NestedOptional;

  init() {
    self.data = NestedOptional{
      foo: null,
      bar: true,
      nested: InnerStruct{
        s: "hello",
        b: false
      }
    };
  }
}