struct Level2 {
  innerVal: Int;
  toggle: Bool;
}

contract OptionalNested {
  val: Level2?;

  init() {
    self.val = null;
  }
}
