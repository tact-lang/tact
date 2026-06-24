struct OptBool {
  a: Bool?;
}

contract OptBoolContract {
  val: OptBool;

  init() {
    self.val = OptBool{a: null};
  }
}