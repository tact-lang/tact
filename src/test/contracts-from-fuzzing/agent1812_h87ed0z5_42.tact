// Testing Bool serialization edge cases
contract BoolDefaults {
  btrue: Bool = true;
  bfalse: Bool = false;
  optT: Bool? = true;
  optF: Bool? = false;
  optN: Bool? = null;

  init() {
    self.btrue = false;
    self.bfalse = true;
    self.optT = null;
    self.optF = true;
    self.optN = false;
  }
}