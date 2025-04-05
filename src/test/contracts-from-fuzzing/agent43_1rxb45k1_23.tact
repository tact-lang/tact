message A { x: Int; }
message B { a: A; }

contract Test {
  receive(msg: B) {
    let y = msg.a.x;
  }
}