// optional int with serialization tag
contract TestContract {
  val: Int? as uint32;

  init() {
    self.val = null;
  }
}