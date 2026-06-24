struct NestedStruct {
  inner: InnerStruct;
}

struct InnerStruct {
  val: Int;
  flag: Bool;
  name: String;
  optNum: Int?;
}

contract DeepNestedTest {
  data: NestedStruct;

  init() {
    self.data = NestedStruct{
      inner: InnerStruct{
        val: 1,
        flag: true,
        name: "Test",
        optNum: null,
      },
    };
  }
}
