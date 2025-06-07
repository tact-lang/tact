struct OptDefault {
  n: Int? = null;
  txt: String? = null;
}

contract OptDefaultsTest {
  d: OptDefault;

  init() {
    self.d = OptDefault{};
  }
}