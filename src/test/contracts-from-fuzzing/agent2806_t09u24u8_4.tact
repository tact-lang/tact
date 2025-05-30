struct OptionalStruct {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptTest {
  val: OptionalStruct;

  init() {
    self.val = OptionalStruct{
      a: null,
      b: true,
      c: "hello"
    };
  }
}