// test of bool field default true
contract BoolDefault {
  flag: Bool = true;
  otherFlag: Bool;

  init() {
    self.otherFlag = false;
  }
}