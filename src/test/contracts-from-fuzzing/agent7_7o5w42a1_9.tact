message Msg {
  a: Int;
}

struct Wrapper {
  m: Msg;
}

contract Test {
  receive() {
    let w = Wrapper { m: Msg { a: 42 } };
  }
}