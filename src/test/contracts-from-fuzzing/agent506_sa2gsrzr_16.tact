struct Deep {
  fld: Int;
}

contract MultiStorageVars {
  x: Int;
  y: Bool;
  z: String;
  addr: Address;
  nested: Deep;
  optInt: Int?;
  optBool: Bool?;

  init() {
    self.x = 1;
    self.y = false;
    self.z = "sample";
    self.addr = myAddress();
    self.nested = Deep{fld:42};
    self.optInt = null;
    self.optBool = true;
  }
}