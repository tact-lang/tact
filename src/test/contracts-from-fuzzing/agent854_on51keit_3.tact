struct DefaultVals {
  x: Int = 1;
  y: Bool = true;
  z: String = "hello";
  optInt: Int?;
}

contract DefaultsContract {
  val: DefaultVals;

  init() {
    self.val = DefaultVals{ z: "world", optInt: null };
  }
}