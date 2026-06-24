struct DefaultVals {
  val1: Int = 7;
  val2: Bool = true;
  val3: String = "Hello";
}

contract DefaultsContract {
  fv: DefaultVals;

  init() {
    self.fv = DefaultVals{};
  }
}