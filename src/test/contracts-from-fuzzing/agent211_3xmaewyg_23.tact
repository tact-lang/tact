struct RemainC {
  header: Int;
  remain: Cell as remaining;
}

contract RemCellStorage {
  s: RemainC;

  init() {
    self.s = RemainC{
      header: 42,
      remain: emptyCell(),
    };
  }
}
