struct Opts {
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
}

contract Test {
  data: Opts;

  init() {
    self.data = Opts {
      optInt: null,
      optBool: true,
      optStr: "hello",
    };
  }
}