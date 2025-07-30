message Inner {
  id: Int
}

message Outer {
  inner: Inner
}

contract Test {
  receive() {
    let m = Outer{ inner: Inner{ id: 10 } };
  }
}