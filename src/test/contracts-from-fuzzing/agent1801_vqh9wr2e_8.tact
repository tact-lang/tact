struct OptionalNest {
  s: String = "abc";
  i: Int?;
  b: Bool?;
}

contract OptStructField {
  data: OptionalNest;

  init() {
    self.data = OptionalNest{
      s: "def",
      i: null,
      b: true,
    };
  }
}