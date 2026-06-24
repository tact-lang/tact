struct N {
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
}

contract Opts {
  val: N;

  init() {
    self.val = N{
      optInt: null,
      optBool: null,
      optStr: null
    };
  }
}