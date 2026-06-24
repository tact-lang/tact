struct Params {
  enabled: Bool = true;
  threshold: Int = 10;
  description: String = "Test";
}

contract Test {
  settings: Params;

  init() {
    self.settings = Params{};
  }
}