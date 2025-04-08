struct DeepOpt {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptionalFields {
  opt: DeepOpt;

  init() {
    self.opt = DeepOpt{
      a: null,
      b: true,
      c: null,
    };
  }
}