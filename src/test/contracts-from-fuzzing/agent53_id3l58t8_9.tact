struct Data {
  value: Int;
}

message M1 {
  data: Data;
}

message M2 {
  data: Data;
}

contract Test {
  receive(msg: M1) {
    // use
  }
}