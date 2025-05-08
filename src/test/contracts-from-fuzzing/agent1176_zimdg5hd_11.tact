contract FlatManyFields {
  a: Int = 1; b: Int = 2; c: Int = 3; d: Int = 4; e: Int = 5;
  f: Bool = false; g: Bool = true; h: Bool = false; i: Bool = true; j: Bool = false;
  x: String = "x"; y: String = "y"; z: String = "z"; s: String = "s"; t: String = "t";
  u: Address?; v: Address?;

  init() {
    self.u = null;
    self.v = null;
  }
}