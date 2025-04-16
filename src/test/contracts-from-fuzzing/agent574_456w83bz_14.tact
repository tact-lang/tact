// test contract with very long list of bool fields
contract LargeBoolArray {
  b01: Bool;
  b02: Bool;
  b03: Bool;
  b04: Bool;
  b05: Bool;
  b06: Bool;
  b07: Bool;
  b08: Bool;
  b09: Bool;
  b10: Bool;

  init() {
    self.b01 = true;
    self.b02 = false;
    self.b03 = true;
    self.b04 = false;
    self.b05 = true;
    self.b06 = false;
    self.b07 = true;
    self.b08 = false;
    self.b09 = true;
    self.b10 = false;
  }
}