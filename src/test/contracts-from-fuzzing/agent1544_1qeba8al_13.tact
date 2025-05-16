contract MixedTypes {
  n: Int;
  b: Bool;
  s: String;
  c: Cell;
  a: Address;

  init() {
    self.n = 1;
    self.b = true;
    self.s = "hi";
    self.c = emptyCell();
    self.a = myAddress();
  }
}
