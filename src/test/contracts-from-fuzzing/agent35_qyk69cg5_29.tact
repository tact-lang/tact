message Msg {
  optInt: Int?;
}

contract Test {
  receive() {
    let m = Msg{optInt: null};
  }
}