struct DeepOptional {
  nested: Int?;
}

struct OptionalHolder {
  inside: DeepOptional?;
}

contract Test {
  opt: OptionalHolder;
  init() {
    self.opt = OptionalHolder{ inside: null };
  }
}