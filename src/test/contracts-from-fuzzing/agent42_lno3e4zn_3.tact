contract ManyFields {
  a: Int;
  b: Bool;
  c: Int?;
  d: map<Int, Int>;
  e: String;
  f: Address;

  init() {
    self.a = 1;
    self.b = true;
    self.c = null;
    self.d = emptyMap();
    self.e = "Test";
    self.f = myAddress();
  }
}