struct MixDefaults {
  a: Int = 5;
  b: String = "abc";
  c: Bool = true;
  d: Int? = null;
  e: String? = null;
}

contract MixDefaultsContract {
  data: MixDefaults;

  init() {
    self.data = MixDefaults{};
  }
}