struct Base {
  x: Int;
}

message Embed {
  base: Base;
}

contract Test {
  receive(msg: Embed) {
    let val = msg.base.x;
  }
}