struct OptStrInt {
  o: Int?;
  s: String;
}

contract OptStructField {
  data: OptStrInt?;

  init() {
    self.data = null;
  }
}