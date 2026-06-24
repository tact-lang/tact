struct DeepOpt {
  nested: InnerOpt?;
}

struct InnerOpt {
  x: Int;
  y: Bool;
}

contract TestContract {
  data: DeepOpt;

  init() {
    self.data = DeepOpt{nested: InnerOpt{x: 99, y: false}};
  }
}
