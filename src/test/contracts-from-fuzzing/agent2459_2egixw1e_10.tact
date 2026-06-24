struct Opts {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Address?;
}

contract TestContract {
  data: Opts;

  init() {
    self.data = Opts{
      a: null,
      b: "hello",
      c: null,
      d: myAddress()
    };
  }
}