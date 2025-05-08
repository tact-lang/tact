struct MessagePayload {
  amount: Int as uint32;
  comment: String?;
}

contract MsgStore {
  payload: MessagePayload;

  init() {
    self.payload = MessagePayload{
      amount: 55,
      comment: null
    };
  }
}