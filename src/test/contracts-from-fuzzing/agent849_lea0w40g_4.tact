contract TestContract {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: String;
  g: Int?;
  h: Bool?;
  i: Address?;
  j: Cell?;
  k: Slice?;
  l: String?;

  init() {
    self.a = 1;
    self.b = true;
    self.c = myAddress();
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
    self.f = "hello";
    self.g = null;
    self.h = null;
    self.i = null;
    self.j = null;
    self.k = null;
    self.l = null;
  }
}