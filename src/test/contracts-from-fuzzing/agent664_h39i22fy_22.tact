// optional structs within optionals

struct DeepOpt {
  v: Int;
}

contract Test {
  d: DeepOpt?;

  init() {
    self.d = null;
  }
}