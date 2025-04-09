contract ManyTypes {
  i: Int;
  b: Bool;
  s: String;
  a: Address;

  init() {
    self.i = -42;
    self.b = true;
    self.s = "hello";
    self.a = myAddress();
  }
}