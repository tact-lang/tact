message Wrapped {
  inner: Another
}

struct Another {
  x: Int
}

contract Test {
  receive(msg: Wrapped) {}
}