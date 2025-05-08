struct Val {
  val1: Int;
  val2: String;
}

contract OptionalStructContract {
  field: Val?;

  init() {
    self.field = null;
  }
}
