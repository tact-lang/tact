message Inner { y: Int }

message Outer { inner: Inner }

contract Test {
  receive(msg: Outer) {
    // nested message reception
  }
}