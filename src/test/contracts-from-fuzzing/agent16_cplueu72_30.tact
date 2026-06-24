message Outer {
  nested: Inner;
}

message Inner {}

contract Test {
  receive(msg: Outer) {
    let x = 1;
  }
}