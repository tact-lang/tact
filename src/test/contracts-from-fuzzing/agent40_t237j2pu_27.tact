struct Box {
  data: Cell;
}

contract Test {
  receive() {
    let c = beginCell().endCell();
    let b = Box { data: c };
  }
}