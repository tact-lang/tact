struct DeepOpt {
  s: String?;
  b: Bool;
}

struct OptOuter {
  inner: DeepOpt?;
  flag: Bool;
}

contract OptNest {
  data: OptOuter;

  init() {
    self.data = OptOuter{
      inner: DeepOpt{s: null, b: false},
      flag: true
    };
  }
}