message X {a: Int;}

message Y {x: X;}

contract Test {
  receive(msg: Y) {
    msg.x.a = 10;
  }
}