struct S1 { a: Int; b: Bool?; }
struct S2 { c: String; d: Int?; }

contract BigContract {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  s1field: S1;
  s2field: S2;

  init() {
    self.a = 1;
    self.b = true;
    self.c = "hi";
    self.d = myAddress();
    self.e = emptyCell();
    self.s1field = S1{ a: 42, b: null };
    self.s2field = S2{ c: "abc", d: null };
  }
}