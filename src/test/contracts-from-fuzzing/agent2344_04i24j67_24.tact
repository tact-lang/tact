struct Toggle {
  enabled: Bool = true;
  disabled: Bool = false;
}

contract ToggleDefaults {
  s: Toggle;

  init() {
    self.s = Toggle{};
  }
}