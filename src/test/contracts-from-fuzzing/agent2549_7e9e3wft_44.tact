struct OptionalCell {
  cell: Cell?;
}

contract OptCellStore {
  data: OptionalCell;

  init() {
    self.data = OptionalCell{
      cell: null
    };
  }
}