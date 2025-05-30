contract ManyFields {
  a: Int;
  b: Bool;
  c: Int?;
  d: String;
  e: Address;
  f: Cell;
  g: Slice;

  init() {
    self.a = 1;
    self.b = true;
    self.c = null;
    self.d = "hello";
    self.e = myAddress();
    self.f = emptyCell();
    self.g = emptyCell().asSlice();
  }
}