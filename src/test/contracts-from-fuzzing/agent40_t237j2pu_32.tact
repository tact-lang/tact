message HasString {
  text: String;
}

contract Test {
  receive(msg: HasString) {
    let t = msg.text;
  }
}