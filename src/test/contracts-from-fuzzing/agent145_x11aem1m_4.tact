contract ManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
  g: String;
  h: Bool;
  i: Int;
  j: Slice;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "abc";
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
    self.f = myAddress();
    self.g = "def";
    self.h = false;
    self.i = 42;
    self.j = emptyCell().asSlice();
  }
}