message Msg {}

contract Test {
  receive(msg: Msg) {
    let x = 1;
  }
}