struct OnlyOptDefaults {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OnlyOptDefaultsTest {
  data: OnlyOptDefaults;

  init() {
    self.data = OnlyOptDefaults{
      a: null,
      b: null,
      c: null
    };
  }
}