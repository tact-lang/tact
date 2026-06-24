struct IntWrap {
  val: Int;
}

contract IntDifference {
  a: IntWrap = IntWrap{ val:7 };
  b: Int = 8;

  init() {
    self.a = self.a;
  }

  receive() {
    self.b = self.b + 1;
  }
}