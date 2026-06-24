struct DefaultOption {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract TestDefOpt {
  v: DefaultOption;

  init() {
    self.v = DefaultOption{};
  }
}