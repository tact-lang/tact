struct SliceCell {
  s: Slice;
  c: Cell;
}

contract TestContract {
  val: SliceCell;

  init() {
    self.val = SliceCell{
      s: emptyCell().asSlice(),
      c: emptyCell()
    };
  }
}