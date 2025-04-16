contract SparsePacked {
  flagA: Bool;
  tiny: Int as uint1;
  flagB: Bool;
  flagC: Bool;
  medium: Int as uint4;

  init() {
    self.flagA = true;
    self.tiny = 1;
    self.flagB = false;
    self.flagC = true;
    self.medium = 7;
  }
}
