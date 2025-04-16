struct Inner {
  z: Int;
}

message Complex {
  nested: Inner;
  val: Int;
}

contract Test {
  receive(msg: Complex) {
    let z = msg.nested.z;
  }
}