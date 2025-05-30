struct Mid { middle: Int; }

contract ManyFields2 {
  a: Int;
  b: Int?;
  c: String;
  d: String?;
  e: Bool;
  f: Bool?;
  g: Address;
  h: Address?;
  i: Cell;
  j: Cell?;
  k: Slice;
  l: Slice?;
  m: Mid;
  n: Mid?;

  init() {
    self.a = 1;
    self.b = 2;
    self.c = "s";
    self.d = null;
    self.e = true;
    self.f = false;
    self.g = myAddress();
    self.h = myAddress();
    self.i = emptyCell();
    self.j = emptyCell();
    self.k = emptyCell().asSlice();
    self.l = emptyCell().asSlice();
    self.m = Mid{middle:1};
    self.n = null;
  }
}