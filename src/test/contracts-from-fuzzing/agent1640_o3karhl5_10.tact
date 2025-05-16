struct WithCell {
  info: Cell;
}

contract CellStorage {
  data: WithCell;

  init() {
    self.data = WithCell{
      info: emptyCell()
    };
  }
}