contract ManyFieldsPrimitives {
  i: Int;
  b: Bool;
  s: String;
  c: Cell;
  a: Address;

  init() {
    self.i = 10;
    self.b = true;
    self.s = "hi";
    self.c = emptyCell();
    self.a = myAddress();
  }
}