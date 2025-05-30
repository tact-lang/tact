struct OptionalDefaults {
  a: Int? = null;
  b: Bool? = null;
}

contract OptionalDefaultsContract {
  val: OptionalDefaults;

  init() {
    self.val = OptionalDefaults{
      a:5,
      b:true
    };
  }
}