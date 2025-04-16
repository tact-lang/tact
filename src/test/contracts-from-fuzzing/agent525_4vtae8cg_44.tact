struct TailCell {
  a: Int;
  t: Cell as remaining;
}

contract CellRemain {
  rec: TailCell;
  init() {
    self.rec = TailCell{
      a: 99,
      t: emptyCell(),
    };
  }
}