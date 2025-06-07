// contract with many persistent fields of various primitive types
contract Primitives {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "s";
    self.d = myAddress();
    self.e = emptyCell();
    self.f = self.e.asSlice();
  }
}