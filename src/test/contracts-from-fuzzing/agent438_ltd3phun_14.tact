struct MultiOptionals {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract TestContract {
  val: MultiOptionals;

  init() {
    self.val = MultiOptionals{
      x: null,
      y: true,
      z: null
    };
  }
}