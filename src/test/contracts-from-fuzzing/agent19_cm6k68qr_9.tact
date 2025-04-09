message Move {
  dx: Int;
  dy: Int;
}

contract Test {
  receive(msg: Move) {
    // intentionally empty
  }
}