struct MixedOptDefault {
  val1: Int = 1;
  val2: Int?;           // implicit null default
  val3: Bool = true;
  val4: Bool?;          // implicit null default
  val5: String = "hi";
  val6: String?;        // implicit null default
}

contract Test {
  m: MixedOptDefault;
  init() {
    self.m = MixedOptDefault{};
  }
}