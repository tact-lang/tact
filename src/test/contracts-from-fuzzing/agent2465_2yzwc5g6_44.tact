// optional struct with default null and assignment to explicit null
struct HasA {
  a: Int;
}
contract OptStructNull {
  x: HasA? = null;
  receive() {
    self.x = null;
  }
}