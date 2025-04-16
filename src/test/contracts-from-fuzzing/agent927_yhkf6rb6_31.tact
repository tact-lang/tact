struct OptDefault {
  foo: Int? = null;
  bar: Bool? = null;
}

contract OptDefaultsContract {
  val: OptDefault;

  init() {
    self.val = OptDefault{};
  }
}