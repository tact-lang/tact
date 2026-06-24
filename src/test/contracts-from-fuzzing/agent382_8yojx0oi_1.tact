struct DeepNestedOptional {
  inner: InnerStruct?;
}

struct InnerStruct {
  val: Int?;
  s: String?;
}

contract TestContract {
  nested: DeepNestedOptional;

  init() {
    self.nested = DeepNestedOptional{
      inner: InnerStruct{
        val: 42,
        s: "hello"
      }
    };
  }
}