struct A {
  s: Slice;
  c: Cell;
}

contract SliceAndCell {
  a: A;

  init() {
    self.a = A{s: emptyCell().asSlice(), c: emptyCell()};
  }
}