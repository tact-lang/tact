struct Params {
  opt1: Int?;
  opt2: Bool?;
  s: String?;
}

contract OptionalFields {
  p: Params;
  init() {
    self.p = Params{
      opt1: null,
      opt2: true,
      s: null,
    };
  }
}
