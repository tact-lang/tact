// Now test contract with very many persistent fields of mixed types
contract BigMixed {
  i1: Int;
  b1: Bool;
  s1: String;
  o1: Int?;
  o2: Bool?;
  o3: String?;
  c1: Cell;
  sl1: Slice;
  bu1: Builder;

  init() {
    self.i1 = 1;
    self.b1 = true;
    self.s1 = "test";
    self.o1 = null;
    self.o2 = null;
    self.o3 = null;
    self.c1 = emptyCell();
    self.sl1 = emptyCell().asSlice();
    self.bu1 = beginCell();
  }
}