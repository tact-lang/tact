struct L {
  a: Int;
}

contract OptStructs {
  s1: L?;
  s2: L?;
  s3: L?;

  init() {
    self.s1 = null;
    self.s2 = null;
    self.s3 = null;
  }
}