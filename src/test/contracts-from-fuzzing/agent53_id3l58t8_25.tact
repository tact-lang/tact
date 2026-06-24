struct HasCell {
  data: Cell;
}

contract Test {
  receive() {
    let c = HasCell { data: beginCell().asCell() };
  }
}