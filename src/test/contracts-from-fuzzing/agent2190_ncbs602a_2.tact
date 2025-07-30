struct Combo {
  x: Int;
  y: Bool;
  z: String;
}

contract OptionalNestedFields {
  val1: Combo?;  // optional struct
  val2: String?;
  val3: Int?;

  init() {
    self.val1 = null;
    self.val2 = null;
    self.val3 = null;
  }
}