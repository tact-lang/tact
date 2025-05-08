message M1 {
  nested: M2;
}

message M2 {
  value: Int;
}

contract Test {
  receive(msg: M1) {
    let v = msg.nested.value;
  }
}