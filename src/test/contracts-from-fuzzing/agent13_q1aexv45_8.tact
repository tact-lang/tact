contract ManyFields {
  a: Int;
  b: Bool;
  c: Address;
  d: Int?;
  e: Bool?;
  f: map<Int, Int>;

  init() {
    self.a = 1;
    self.b = true;
    self.c = myAddress();
    self.d = null;
    self.e = false;
    self.f = emptyMap();
  }
}