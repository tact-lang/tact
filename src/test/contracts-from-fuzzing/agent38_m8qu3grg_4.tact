message Outer {
  inner: Inner
}

message Inner {
  amount: Int
}

contract Test {
  receive(msg: Outer) {
    // test nested message
  }
}