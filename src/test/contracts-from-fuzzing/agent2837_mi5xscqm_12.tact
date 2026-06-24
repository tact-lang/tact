message(1) Msg {}

struct WrappedMessage {
  payload: Msg;
}

contract TestMessageStruct {
  saved: WrappedMessage;
  init() {
    self.saved = WrappedMessage{ payload: Msg{} };
  }
}