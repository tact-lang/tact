message Embed { inner: Inner; }

message Inner { x: Int; }

contract Test {
  receive(msg: Embed) {
    let v = msg.inner.x;
  }
}