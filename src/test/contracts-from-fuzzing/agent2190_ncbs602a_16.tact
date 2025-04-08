struct Tiny {
  a: Bool;
  b: Bool;
}

contract SparseSmall {
  s: Tiny?;
  z: Int?;
  f: Bool;

  init() {
    self.s = null;
    self.z = null;
    self.f = true;
  }
}