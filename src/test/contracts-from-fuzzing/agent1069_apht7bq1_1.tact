struct Nested {
  val: Int;
  inner: InnerStruct;
}

struct InnerStruct {
  flag: Bool;
  message: String;
}

contract Test {
  data: Nested;

  init() {
    self.data = Nested{
      val: 42,
      inner: InnerStruct{
        flag: true,
        message: "test"
      }
    };
  }
}