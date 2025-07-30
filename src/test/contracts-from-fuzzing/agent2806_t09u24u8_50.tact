struct WithCell {
  c: Cell;
}

contract CellStore {
  data: WithCell;

  init() {
    self.data = WithCell{c: "abc".asComment()};
  }
}