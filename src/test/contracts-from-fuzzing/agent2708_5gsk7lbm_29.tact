struct InOut {
  val: Int;
}

contract SameType {
  x: InOut;
  y: InOut;

  init() {
    self.x = InOut{val:1};
    self.y = InOut{val:2};
  }
}