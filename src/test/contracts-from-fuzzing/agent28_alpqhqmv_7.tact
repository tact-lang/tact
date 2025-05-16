struct CrossMessageStruct {
  msg: InnerMessage
}

message InnerMessage {
  value: Int
}

contract Test {
  receive() {
    let s: CrossMessageStruct = CrossMessageStruct{msg: InnerMessage{value: 42}};
  }
}