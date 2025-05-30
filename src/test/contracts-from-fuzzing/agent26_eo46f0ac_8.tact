message Data {
  count: Int;
}

contract Test {
  receive(msg: Data) {
    let doubled = msg.count * 2;
  }
}

message Another {
  text: String;
}