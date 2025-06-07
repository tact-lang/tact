// Large contract with diverse primitive types directly
contract Test {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Builder;
  g: Address;
  h: Bool?;
  i: Int?;
  j: String?;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "abc";
    self.d = emptyCell();
    self.e = emptyCell().asSlice();
    self.f = beginCell();
    self.g = myAddress();
    self.h = null;
    self.i = 5;
    self.j = null;
  }
}