message Embed { inner: Inner; }

struct Inner { x: Int; }

contract Test {
  receive(msg: Embed) {
    let v = msg.inner.x;
  }
}