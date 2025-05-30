contract LotsOfTypes {
  intField: Int;
  boolField: Bool;
  addrField: Address;
  stringField: String;
  optInt: Int?;
  optBool: Bool?;
  optAddr: Address?;
  optString: String?;

  init() {
    self.intField = 1;
    self.boolField = false;
    self.addrField = myAddress();
    self.stringField = "hi";
    self.optInt = null;
    self.optBool = null;
    self.optAddr = null;
    self.optString = null;
  }
}