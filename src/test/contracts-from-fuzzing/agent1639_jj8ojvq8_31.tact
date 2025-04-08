struct OptStr {
  s: String?;
}

contract OptionalStringStruct {
  val: OptStr?;

  init() {
    self.val = null;
  }
}