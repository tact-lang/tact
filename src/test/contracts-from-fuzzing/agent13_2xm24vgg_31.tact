struct Inner {
  val: Int;
}

message Container {
  inner: Inner = Inner{val: 5};
}

contract Test {
  receive() {
    Container{};
  }
}