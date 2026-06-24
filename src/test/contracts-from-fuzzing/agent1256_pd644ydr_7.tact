struct WithDefaults {
  foo: Int = 1;
  bar: Bool = false;
  baz: String = "default";
  qux: Int?; // implicitly null
}

contract DefaultsPersistence {
  data: WithDefaults;

  init() {
    self.data = WithDefaults{};
  }
}
