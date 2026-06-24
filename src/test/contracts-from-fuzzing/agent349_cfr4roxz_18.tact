// Focus: optional contract persistent state variables with init
contract OptVars {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: String?;

  init() {
    self.a = null;
    self.b = true;
    self.c = null;
    self.d = "text";
  }
}