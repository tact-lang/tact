// Combination: optional Int, Bool, Address
contract MixedNullables {
  optInt: Int?;
  optBool: Bool?;
  optAddr: Address?;
  init() {
    self.optInt = null;
    self.optBool = null;
    self.optAddr = null;
  }
}
