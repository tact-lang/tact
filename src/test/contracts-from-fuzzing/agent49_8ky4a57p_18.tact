struct TestStruct {
  a: Int;
}

message StructMessage {
  s: TestStruct;
}

contract Test {
  receive() {
    let a: Int = 0;
  }
}