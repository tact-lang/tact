struct ManyDefaults {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
  d: Bool = true;
  e: Bool = false;
  f: String = "hello";
  g: String = "world";
}

contract NestedDefaults {
  content: ManyDefaults;

  init() {
    self.content = ManyDefaults{};
  }
}