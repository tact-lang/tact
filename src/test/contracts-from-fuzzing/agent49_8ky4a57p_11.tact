message Outer {
  inner: Inner;
}

message Inner {
  value: Int;
}

contract Test {
  receive() {
    let a: Int = 0;
  }
}