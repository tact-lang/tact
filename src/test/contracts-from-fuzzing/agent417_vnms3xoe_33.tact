struct InnerDefaults { a: Int = 7; }

contract TestInnerDef {
  f: InnerDefaults;
  init() {
    self.f = InnerDefaults{};
  }
}