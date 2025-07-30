message Msg {
  s: String;
}

contract Test {
  receive() {
    let m = Msg { s: "hello" };
  }
}