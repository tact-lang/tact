message Msg2 { }

contract Test {
  receive(msg: Msg2) {
    let dummy = 1;
  }
}