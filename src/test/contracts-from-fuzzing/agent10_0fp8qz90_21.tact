struct A {
  f: Int;
}

message B {
  s: A;
}

contract TestContract {
  receive(msg: B) {}
}