struct Triple {
  first: Int;
  second: Int;
  third: Int;
}

contract ListManyPrimitives {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Address;
  f: Slice;
  g: Builder;
  h: Bool?;
  i: Int?;
  j: String?;
  k: Cell?;
  l: Address?;
  m: Slice?;
  n: Builder?;
  t: Triple;

  init() {
    self.a = 1;
    self.b = false;
    self.c = "x";
    self.d = emptyCell();
    self.e = myAddress();
    self.f = emptyCell().asSlice();
    self.g = beginCell();
    self.h = null;
    self.i = null;
    self.j = null;
    self.k = null;
    self.l = null;
    self.m = null;
    self.n = null;
    self.t = Triple{first:1, second:2, third:3};
  }
}