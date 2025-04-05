message M {
  s: Cell;
}

contract TestContract {
  receive(msg: M) {}
}