struct HasStringAndCell {
  s: String;
  c: Cell;
}

contract StringCellStorage {
  val: HasStringAndCell;

  init() {
    self.val = HasStringAndCell{
      s: "hi there",
      c: emptyCell(),
    };
  }
}
