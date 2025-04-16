message WithCell {
  c: Cell;
}

contract Test {
  receive(msg: WithCell) {}
}