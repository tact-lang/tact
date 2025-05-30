struct DefaultsAndOpts {
  a: Int = 0;
  b: Int?;
  c: String = "str";
  d: Bool?;
}

contract TestContract {
  data: DefaultsAndOpts;

  init() {
    self.data = DefaultsAndOpts{};
  }
}