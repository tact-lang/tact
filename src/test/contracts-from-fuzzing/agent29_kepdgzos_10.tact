struct HasDefaults {
  a: Int = 2;
  b: String = "hi";
  c: Bool = true;
  d: Int?;
  e: Bool?;
}

contract DefVals {
  val: HasDefaults;

  init() {
    self.val = HasDefaults{
      d: null,
      e: null,
    };
  }
}