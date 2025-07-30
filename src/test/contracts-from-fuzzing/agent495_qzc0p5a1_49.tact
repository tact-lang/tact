struct WithDefaults {
  foo: Int = 10;
  bar: Bool = true;
}
contract DefTest {
  x: WithDefaults;
  init() {
    self.x = WithDefaults{};
  }
}