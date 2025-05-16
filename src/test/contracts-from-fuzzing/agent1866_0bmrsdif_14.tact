struct OptionalStruct {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract Opts {
  opt: OptionalStruct;

  init() {
    self.opt = OptionalStruct{
      a: null,
      b: null,
      c: null,
    };
  }
}