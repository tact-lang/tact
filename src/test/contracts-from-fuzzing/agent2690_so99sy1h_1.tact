struct Inner {
  val1: Int;
  val2: String;
  optVal: Bool?;
}

contract DeepOptionalTest {
  nested: Inner?;

  init() {
    self.nested = null;
  }
}