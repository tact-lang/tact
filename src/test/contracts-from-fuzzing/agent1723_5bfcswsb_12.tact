struct Param {
  a: Int;
  b: String;
  c: Bool;
}

contract OptionalParam {
  param: Param?;

  init() {
    self.param = null;
  }
}