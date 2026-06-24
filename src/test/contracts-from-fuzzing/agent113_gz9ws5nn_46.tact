struct OptionalInt {
  val: Int?;
}

contract OptionalInContract {
  x: OptionalInt;

  init() {
    self.x = OptionalInt{val:null};
  }
}