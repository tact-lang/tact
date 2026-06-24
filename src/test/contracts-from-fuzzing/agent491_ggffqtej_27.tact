struct R {
  x: Slice;
  y: Slice;
}

contract ManySlice {
  rec: R;

  init() {
    self.rec = R{ x: emptyCell().asSlice(), y: emptyCell().asSlice() };
  }
}
