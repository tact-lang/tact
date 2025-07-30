struct MixOpt {
  a: Int?;
  b: Bool;
  c: Int?;
  d: Bool;
}

contract TestContract {
  data: MixOpt;

  init() {
    self.data = MixOpt{
      a: null,
      b: true,
      c: 42,
      d: false
    };
  }
}