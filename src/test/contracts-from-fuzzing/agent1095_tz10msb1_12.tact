struct ZeroDefaults { a: Int; b: Bool }

contract TestZeroDefaults {
  s: ZeroDefaults;

  init() {
    self.s = ZeroDefaults{ a: 0, b: false };
  }
}