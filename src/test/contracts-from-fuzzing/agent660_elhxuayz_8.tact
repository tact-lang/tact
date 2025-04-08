struct Defaults {
  a: Int = 5;
  b: Bool = true;
  c: String = "default";
  d: Int?; // implicitly null
}

contract DefaultsTest {
  storage: Defaults;

  init() {
    self.storage = Defaults{};
  }
}