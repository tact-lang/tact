struct Container {
  contents: String;
}

message Envelope {
  item: Container;
}

contract Test {
  receive(msg: Envelope) {
    let str = msg.item.contents;
  }
}