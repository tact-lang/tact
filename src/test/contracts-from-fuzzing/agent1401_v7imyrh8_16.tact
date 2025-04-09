struct DeepOptional {
  a: Int?;
  b: Bool?;
}

contract DeepOptionalContract {
  d: DeepOptional?;

  init() {
    self.d = null;
  }
}