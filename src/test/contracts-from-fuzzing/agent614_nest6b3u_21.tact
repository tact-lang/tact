struct Val {
  s: String;
  n: Int;
}

contract ManyOpt {
  a: Val?;
  b: String?;
  c: Bool?;
  d: Int?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = null;
  }
}