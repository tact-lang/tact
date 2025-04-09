struct Inner {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract TestContract {
  nestedOpt: Inner;
  init() {
    self.nestedOpt = Inner{ a: null, b: null, c: null };
  }
}