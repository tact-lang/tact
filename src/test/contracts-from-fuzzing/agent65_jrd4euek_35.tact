struct ManyInits {
  val1: Int = 1;
  val2: Int = 2;
  val3: Int = 3;
  val4: Int = 4;
}

contract ManyDefaults {
  mydata: ManyInits;
  init() {
    self.mydata = ManyInits{};
  }
}