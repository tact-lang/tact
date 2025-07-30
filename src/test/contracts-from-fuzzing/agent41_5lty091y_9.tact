message Msg {
  nested: Nested
}

struct Nested {
  x: Int;
  y: Int;
}

contract Test {
  receive(msg: Msg) {
    let sum = msg.nested.x + msg.nested.y;
  }
}