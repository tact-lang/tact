message Outer {
  inner: Inner;
}

struct Inner {
  x: Int;
}

contract TestContract {
  receive(msg: Outer) {}
}