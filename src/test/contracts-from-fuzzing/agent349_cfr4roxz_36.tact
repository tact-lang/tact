// Compose persistent storage with many nested optionals on direct vars
contract NestedOptVars {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int?;
  e: Bool?;
  f: String?;

  init() {
    self.a = null;
    self.b = true;
    self.c = null;
    self.d = 5;
    self.e = null;
    self.f = "ok";
  }
}