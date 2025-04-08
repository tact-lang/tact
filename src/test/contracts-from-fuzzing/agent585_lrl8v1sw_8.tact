contract Mixed {
  i: Int = 7;
  b: Bool = true;
  addr: Address;
  s: String = "x";
  optInt: Int?;
  optBool: Bool?;
  
  init() {
    self.addr = myAddress();
  }
}