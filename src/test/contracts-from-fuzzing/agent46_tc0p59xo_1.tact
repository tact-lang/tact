struct S1 {
  a: Int; 
  b: Bool;
  c: Slice;
}

contract Test {
  s: S1;

  init() {
    self.s = S1{ a: 1, b: true, c: emptyCell().asSlice() };
  }
}