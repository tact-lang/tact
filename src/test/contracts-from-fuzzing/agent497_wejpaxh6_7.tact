struct Defaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "default";
  d: Int?; // implicitly null
}

contract TestContract {
  store: Defaults;

  init() {
    self.store = Defaults{};
  }
}