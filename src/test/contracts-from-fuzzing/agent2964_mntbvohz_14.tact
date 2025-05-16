struct DefaultsNestedOptional {
  a: Int = 5;
  b: String? = null;
  c: Bool = true;
}

struct OuterWrapper {
  inner: DefaultsNestedOptional = DefaultsNestedOptional{};
}

contract DefaultsInit {
  stored: OuterWrapper;

  init() {
    self.stored = OuterWrapper{}; // should use full defaults
  }
}