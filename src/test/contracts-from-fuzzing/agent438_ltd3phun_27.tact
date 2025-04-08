struct DefaultsAndOpts {
  a: Int = 5;
  b: String?;
  c: Bool = true;
}

contract TestContract {
  data: DefaultsAndOpts;

  init() {
    self.data = DefaultsAndOpts{};
  }
}