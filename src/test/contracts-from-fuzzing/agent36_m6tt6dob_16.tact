contract InterleavedOptionals {
  a: Int?; b: Int;
  c: Bool?; d: Bool;
  e: String?; f: String;
  g: Address?; h: Address;
  init() {
    self.a = null; self.b = 1;
    self.c = null; self.d = false;
    self.e = null; self.f = "";
    self.g = null; self.h = myAddress();
  }
}