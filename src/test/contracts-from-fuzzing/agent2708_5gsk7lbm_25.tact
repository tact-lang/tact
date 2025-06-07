struct SerialDefaults {
  val1: Int as uint4 = 1;
  val2: Int as int8 = -4;
  val3: Int as coins = ton("3");
}

contract DefaultsSerialized {
  vals: SerialDefaults;
  init() {
    self.vals = SerialDefaults{};
  }
}