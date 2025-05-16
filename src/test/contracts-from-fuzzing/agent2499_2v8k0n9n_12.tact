contract ManyFields {
  a: Int;
  b: Int;
  c: Bool;
  d: Address;
  e: Cell;
  f: Slice;
  g: String;
  h: Bool?;
  i: Int?;
  j: String?;

  init() {
    self.a = 1;
    self.b = 2;
    self.c = false;
    self.d = myAddress();
    self.e = emptyCell();
    self.f = emptyCell().asSlice();
    self.g = "text";
    self.h = null;
    self.i = null;
    self.j = null;
  }
}
