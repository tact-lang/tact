// Test repeated use of empty slice overlay
struct S1 {
  rest: Slice as remaining;
}

struct S2 {
  rest: Slice as remaining;
}

contract RepeatedRemaining {
  s1: S1;
  s2: S2;

  init() {
    self.s1 = S1 { rest: emptyCell().asSlice() };
    self.s2 = S2 { rest: emptyCell().asSlice() };
  }
}