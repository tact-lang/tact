struct HasDefaults {
  a: Int = 5;
  b: Bool = false;
  c: String = "abc";
}

contract DefaultedStruct {
  val: HasDefaults = HasDefaults{};

  init() {
    self.val = self.val;
  }

  receive() {
    self.val = self.val;
  }
}