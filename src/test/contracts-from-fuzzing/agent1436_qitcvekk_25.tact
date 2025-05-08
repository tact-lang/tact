struct DeepOpt {
  x: Int;
  s: String?;
}

struct MidOpt {
  inner: DeepOpt?;
  flag: Bool;
}

contract TestContract {
  combined: MidOpt;

  init() {
    self.combined = MidOpt{
      inner: null,
      flag: false
    };
  }
}