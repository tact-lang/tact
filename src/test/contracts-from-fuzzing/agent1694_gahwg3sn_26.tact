struct S1 {
  flag: Bool;
  txt: String;
  maybe: Int?;
  c: Cell;
  sl: Slice;
  addr: Address?;
}

struct S2 {
  inner: S1;
  another: S1;
}

contract StructMultiUse {
  x: S2;

  init() {
    self.x = S2{
      inner: S1{ flag: true, txt: "a", maybe: null, c: emptyCell(), sl: emptyCell().asSlice(), addr: null },
      another: S1{ flag: false, txt: "b", maybe: null, c: emptyCell(), sl: emptyCell().asSlice(), addr: null }
    };
  }
}