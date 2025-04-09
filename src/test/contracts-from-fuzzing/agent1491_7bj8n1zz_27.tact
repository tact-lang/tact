contract TestContract {
  a: Int = 1;
  b: Bool = true;
  c: String = "c";
  d: Int?;
  e: Bool?;
  f: String?;
  g: Int;
  h: Bool;
  i: String;
  j: Int?;
  k: Bool?;
  l: String?;
  m: Int = 42;
  n: Bool = false;
  o: String = "done";

  init() {
    self.d = null;
    self.e = null;
    self.f = null;
    self.g = -7;
    self.h = false;
    self.i = "hi";
    self.j = 123;
    self.k = true;
    self.l = "ok";
  }
}