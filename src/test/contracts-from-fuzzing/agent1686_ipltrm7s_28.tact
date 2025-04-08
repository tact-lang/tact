struct SDefault {
  x: Int = 5;
}

contract FieldWithDefault {
  val: SDefault;

  init() {
    self.val = SDefault{};
  }
}