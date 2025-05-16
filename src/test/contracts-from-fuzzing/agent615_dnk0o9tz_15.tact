contract AllTypes {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  addrVal: Address;

  init() {
    self.intVal = 10;
    self.boolVal = true;
    self.strVal = "hi";
    self.addrVal = myAddress();
  }
}