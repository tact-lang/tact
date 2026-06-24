struct MixDefaults {
  a: Int = 1;
  b: Bool?;
  c: Int?;
  d: String = "hi";
}

contract MixedDefaultsTest {
  val: MixDefaults;

  init() {
    self.val = MixDefaults{ b: null, c: null };
  }
}
