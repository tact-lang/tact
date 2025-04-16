message Msg {
  val: Int;
}

struct WrapMsg {
  m: Msg;
}

contract PersistMsgInsideStruct {
  store: WrapMsg = WrapMsg{
    m: Msg{ val: 99 },
  };

  receive() {
    self.store = self.store;
  }
}