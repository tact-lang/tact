struct NestedDefaults {
  a: Int = 1;
  b: Bool = false;
}

struct WithNestedDefaults {
  foo: NestedDefaults = NestedDefaults{};
  s: String = "hi";
}

contract CheckDef {
  st: WithNestedDefaults;

  init() {
    self.st = WithNestedDefaults{};
  }
}