struct WithDefaults {
  foo: Int = 4;
  bar: Bool = false;
  baz: String = "abc";
}

contract DefTest {
  val: WithDefaults;

  init() {
    self.val = WithDefaults{};
  }
}
