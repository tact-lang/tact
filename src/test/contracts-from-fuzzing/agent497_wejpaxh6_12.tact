struct DeepOptionals {
  o1: Int?;
  o2: Bool?;
  o3: String?;
}

struct WrapOpt {
  inner: DeepOptionals?;
}

contract TestContract {
  wo: WrapOpt?;

  init() {
    self.wo = WrapOpt{inner: null};
  }
}