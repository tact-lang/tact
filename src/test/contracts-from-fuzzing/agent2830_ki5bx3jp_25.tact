struct OptionalS {
  a: Int?;
  b: Bool;
}

contract OptStructField {
  st: OptionalS?;
  init() {
    self.st = null;
  }
}