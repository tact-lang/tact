contract OptionalDefault {
  a: Int?;

  init() {
    self.a = null;
  }
}

contract OptionalAssign {
  a: Int?;

  init() {
    self.a = 5;
  }
}