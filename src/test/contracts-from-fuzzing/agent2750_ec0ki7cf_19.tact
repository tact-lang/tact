struct DefaultBool {
  b: Bool = false;
}

contract DefaultBoolTest {
  x: DefaultBool;
  init() {
    self.x = DefaultBool{};
  }
}
