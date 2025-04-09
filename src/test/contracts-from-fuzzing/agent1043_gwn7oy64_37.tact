// Test serialization with explicit slice
struct S {
  s: Slice;
}

contract TestContract {
  s: S;

  init() {
    self.s = S{ s: emptyCell().asSlice() };
  }
}