struct OverlapDefaults {
  val1: Int = 0;
  val2: Int = 1;
}

contract DefaultsOverwrite {
  field: OverlapDefaults;
  init() {
    self.field = OverlapDefaults{};
    self.field.val1 = 10;
    self.field.val2 = 20;
  }
}