struct OptWrap {
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
}

contract OptionalStructs {
  a: OptWrap?;
  b: OptWrap?;

  init() {
    self.a = null;
    self.b = OptWrap{
      optInt: 5,
      optBool: false,
      optStr: "xyz"
    };
  }
}