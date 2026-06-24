struct Basic {
  a: Int;
}

contract OptionalBasic {
  optField: Basic?;
  init() {
    self.optField = null;
  }
}