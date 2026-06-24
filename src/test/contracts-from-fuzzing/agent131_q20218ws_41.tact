// optional string field with default null
contract OptStringDefault {
  msg: String? = null;

  init() {
    self.msg = "hello";
  }
}