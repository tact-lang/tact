struct HasRem {
  val: Int = 0;
  tail: Slice as remaining;
}

contract Test {
  data: HasRem;

  init() {
    self.data = HasRem{
      val: 5,
      tail: emptyCell().asSlice()
    };
  }
}
