struct OptionalNesting {
  optInt: Int?;
  optBool: Bool?;
  optString: String?;
}

contract OptionalStructs {
  data: OptionalNesting?;

  init() {
    self.data = null;
  }
}
