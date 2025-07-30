struct Mid {
  val: Int?;
}

contract MidOptField {
  f: Mid?;

  init() {
    self.f = null;
  }
}
