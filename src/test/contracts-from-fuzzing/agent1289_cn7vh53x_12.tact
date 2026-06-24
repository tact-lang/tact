struct MixDefaults {
  a: Int;
  b: Bool = false;
  c: Int?;
  d: Bool? = null;
}

contract PartialDefaultsTest {
  record: MixDefaults;

  init() {
    self.record = MixDefaults{ a: 42, c: null };
  }
}
