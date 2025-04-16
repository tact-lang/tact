struct OptionalDefaults {
  name: String? = null;
  flag: Bool? = null;
  num: Int? = null;
}

contract OptionalDefaultsTest {
  val: OptionalDefaults;

  init() {
    self.val = OptionalDefaults{
      name: null,
      flag: null,
      num: null
    };
  }
}