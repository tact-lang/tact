struct Point { x: Int; y: Int; }

message Located {
  pos: Point;
}

contract Test {
  receive(msg: Located) {
    let xcoord = msg.pos.x;
  }
}