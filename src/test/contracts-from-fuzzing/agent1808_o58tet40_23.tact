contract EmptyInits {
  a: Int;
  b: Bool;
  c: String;
  d: Address;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "abc";
    self.d = myAddress();
  }
}