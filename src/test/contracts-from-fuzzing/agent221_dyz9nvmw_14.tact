struct Opted {
  x: Int?;
  y: Int?;
}

contract OptionalDefaults {
  val: Opted;

  init() {
    self.val = Opted{
      x: null,
      y: null
    };
  }
}