struct Defaults {
  val: Int = 5;
  flag: Bool = true;
  note: String = "hi";
  optVal: Int?; // default null
}

contract StructWithDefaults {
  field: Defaults;

  init() {
    self.field = Defaults{ note: "custom" };
  }
}
