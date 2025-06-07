struct A {
  x: Int;
}

message B {
  y: A;
}

contract Test {
  receive() {}
}