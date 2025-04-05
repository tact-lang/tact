struct Inner { x: Int; }

struct Outer { y: Inner; }

message Msg {
  data: Outer;
}

contract Test {
  receive(msg: Msg) {
    let z = msg.data.y.x;
  }
}