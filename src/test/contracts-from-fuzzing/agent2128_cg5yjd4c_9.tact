struct HasString {
  s: String;
}

struct IncludesSliceCell {
  s: Slice;
  c: Cell;
  child: HasString;
}

contract CompositeFieldTest {
  dat: IncludesSliceCell;

  init() {
    self.dat = IncludesSliceCell{
      s: emptyCell().asSlice(),
      c: emptyCell(),
      child: HasString{
        s: "hello"
      }
    };
  }
}