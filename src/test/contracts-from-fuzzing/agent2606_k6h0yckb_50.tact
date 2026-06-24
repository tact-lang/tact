struct OptAliasBad {
  a: Int? as uint8;
  b: Int? as int16;
}

contract OptAliasAssign {
  val: OptAliasBad;

  init() {
    self.val = OptAliasBad{ a: 256, b: -32769 };
  }
}