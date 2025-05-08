struct NestedDefaults {
  flag: Bool = true;
  maybeNum: Int?;
  strVal: String = "default";
  optStr: String?;
}

contract TestNestedDefaults {
  val: NestedDefaults;

  init() {
    self.val = NestedDefaults{
      maybeNum: 42,
      optStr: null
    };
  }
}
