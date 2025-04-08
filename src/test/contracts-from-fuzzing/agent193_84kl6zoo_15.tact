struct Wrapper1 { data: Slice; }
struct Wrapper2 { data: Cell; }
struct Wrapper3 { data: Address; }

struct Combo {
  s: Wrapper1;
  c: Wrapper2;
  a: Wrapper3;
}

contract NestedWrappers {
  combo: Combo;

  init() {
    self.combo = Combo{
      s: Wrapper1{ data: emptyCell().asSlice() },
      c: Wrapper2{ data: emptyCell() },
      a: Wrapper3{ data: myAddress() }
    };
  }
}