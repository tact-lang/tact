struct MessageContent {
  text: String;
  important: Bool;
}

contract WithMessageData {
  msgData: MessageContent;

  init() {
    self.msgData = MessageContent{text: "hi", important: true};
  }
}