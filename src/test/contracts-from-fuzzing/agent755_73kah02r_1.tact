struct NestedStruct {
  foo: Int;
  bar: Bool?;
  inner: InnerStruct;
}

struct InnerStruct {
  baz: String;
  optint: Int?;
}

contract TestContract {
  val: NestedStruct;

  init() {
    self.val = NestedStruct{
      foo: 1,
      bar: true,
      inner: InnerStruct{
        baz: "hi",
        optint: 10,
      }
    };
  }
}
