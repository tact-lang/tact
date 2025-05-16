struct SliceCellStr {
  s: Slice;
  c: Cell;
  str: String;
}

contract SliceCellStrTest {
  dat: SliceCellStr;
  init() {
    self.dat = SliceCellStr{
      s: emptyCell().asSlice(), c: emptyCell(), str: "abc"
    };
  }
}