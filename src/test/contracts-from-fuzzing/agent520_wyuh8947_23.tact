// test contract with nested struct containing optionals with defaults
struct NestedWithDefaults {
  a: Int? = null;
  b: Bool? = null;
}
contract NestedDefaultsTest {
  f: NestedWithDefaults;

  init() {
    self.f = NestedWithDefaults{};
  }
}