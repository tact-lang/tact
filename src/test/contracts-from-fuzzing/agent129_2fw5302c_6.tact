contract TestContract {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: String;
  f: String?;
  g: Address;
  h: Address?;
  i: Cell;
  j: Cell?;

  init() {
    self.a = 1;
    self.b = null;
    self.c = true;
    self.d = false;
    self.e = "contract wide test";
    self.f = null;
    self.g = myAddress();
    self.h = null;
    self.i = emptyCell();
    self.j = null;
  }
}