struct WithString {
  s: String = "some text";
}

contract OptString {
  val: WithString?;

  init() {
    self.val = null;
  }
}