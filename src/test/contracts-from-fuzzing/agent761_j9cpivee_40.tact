struct Sub { s: String }
contract TestStr {
  a: String;
  b: String?;
  c: Sub;
  d: Sub?;
  
  init() {
    self.a = "hi";
    self.b = null;
    self.c = Sub{ s: "ss" };
    self.d = null;
  }
}