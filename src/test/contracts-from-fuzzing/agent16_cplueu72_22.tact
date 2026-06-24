message Outer {
  first: Inner1;
  second: Inner2;
}

message Inner1 {
  value1: Int;
}

message Inner2 {
  value2: Int;
}

contract Test {
  receive(msg: Outer) {
    let a = msg.first.value1 + msg.second.value2;
  }
}