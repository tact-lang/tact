struct DeepNested {
  inner: InnerStruct;
}

struct InnerStruct {
  foo: FooStruct;
}

struct FooStruct {
  bar: Int?;
  baz: String;
}

contract NestedTest {
  data: DeepNested;

  init() {
    self.data = DeepNested{
      inner: InnerStruct{
        foo: FooStruct{
          bar: null,
          baz: "hi"
        }
      }
    };
  }
}