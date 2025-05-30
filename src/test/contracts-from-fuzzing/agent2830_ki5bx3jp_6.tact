struct DeepOpt {
  x: Int?;
  y: Bool;
}

contract OptionalField {
  storage: DeepOpt?;

  init() {
    self.storage = null;
  }
}