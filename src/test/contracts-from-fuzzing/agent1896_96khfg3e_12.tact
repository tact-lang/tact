struct MixDefaults {
  a: Int = 1;
  b: String = "hello";
  c: Bool = true;
}

contract DefaultsTest {
  val: MixDefaults;

  init() {
    self.val = MixDefaults{};
  }
}