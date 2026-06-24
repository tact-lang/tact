message Outer {
  inner: Inner;
}

message Inner {
  value: Int;
}

contract TestContract {
  receive(msg: Outer) {}
}