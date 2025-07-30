contract MultipleFields {
  i: Int;
  b: Bool;
  s: String;
  a: Address;

  init() {
    self.i = 1;
    self.b = true;
    self.s = "abc";
    self.a = myAddress();
  }
}