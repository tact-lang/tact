message Recv1 {}
message Recv2 {}

contract Test {
  receive(msg: Recv1) {
    // handler 1
  }
  receive(msg: Recv2) {
    // handler 2
  }
}