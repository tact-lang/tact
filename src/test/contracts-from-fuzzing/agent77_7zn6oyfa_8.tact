// Long chain of primitive fields with mixed optional/nullables
contract ChainOpt {
    x0: Int?;
    x1: Int;
    x2: Bool?;
    x3: Bool;
    x4: Address?;
    x5: Address;

    init() {
      self.x0 = null;
      self.x1 = 1;
      self.x2 = null;
      self.x3 = true;
      self.x4 = null;
      self.x5 = myAddress();
    }
}