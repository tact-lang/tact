message M {
  data: Int;
}

struct M2 {
  nested: M;
}

contract Test {
  receive(msg: M) {
    let d = msg.data;
  }
}