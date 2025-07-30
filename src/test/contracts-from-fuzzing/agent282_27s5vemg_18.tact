struct NestedOptional {
  n: Int?;
  s: String?;
}

contract OptionalStructField {
  st: NestedOptional?;

  init() {
    self.st = null;
  }
}