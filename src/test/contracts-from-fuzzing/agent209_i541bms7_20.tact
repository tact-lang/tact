// Multiple optional Strings and Slices together
contract ManyOptionalPtrs {
  s1: String?;
  s2: String?;
  s3: String?;
  s4: Slice?;
  s5: Slice?;
  s6: Slice?;

  init() {
    self.s1 = null;
    self.s2 = "xyz";
    self.s3 = null;
    self.s4 = emptyCell().asSlice();
    self.s5 = null;
    self.s6 = null;
  }
}