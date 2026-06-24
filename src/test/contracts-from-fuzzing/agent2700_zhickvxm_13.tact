contract LargeContract {
  a: Bool;
  b: Int;
  c: String;
  d: Address;
  e: Bool?;
  f: Int?;
  g: String;
  h: Cell;
  i: Cell?;
  j: Address?;

  init() {
    self.a = true;
    self.b = 42;
    self.c = "a";
    self.d = myAddress();
    self.e = false;
    self.f = null;
    self.g = "b";
    self.h = emptyCell();
    self.i = null;
    self.j = null;
  }
}