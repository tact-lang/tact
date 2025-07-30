struct OptionalNested {
  inner: Int?;
}

contract OptionalStructField {
  st: OptionalNested;

  init() {
    self.st = OptionalNested{ inner: null };
  }
}