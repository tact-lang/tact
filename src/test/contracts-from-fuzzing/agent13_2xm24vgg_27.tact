message Msg {}

struct S {
  m: Msg;
}

contract Test {
  receive() {
    S{m: Msg{}};
  }
}