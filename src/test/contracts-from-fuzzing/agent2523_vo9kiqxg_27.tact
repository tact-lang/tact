// test init defaults and assignment
contract AssignDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "hey";
  x: Int?;

  init() {
    self.x = null;
    self.b = true;
    self.a = 5;
  }
}
