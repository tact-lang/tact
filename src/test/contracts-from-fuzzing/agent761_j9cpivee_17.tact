struct OptionalStringBool {
  text: String?;
  flag: Bool?;
}

contract OptionalFields {
  val: OptionalStringBool?;

  init() {
    self.val = OptionalStringBool{
      text: "hello",
      flag: null,
    };
  }
}