message A { a: Int; }

message B { b: A; }

contract Test {
  receive(msg: B) {
    let x = msg.b.a;
  }
}