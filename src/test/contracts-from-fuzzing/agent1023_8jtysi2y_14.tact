// optional message struct nested as an optional field
message(123) MsgInner { val: Int }

struct HasMsg {
  innerMsg: MsgInner?;
  flag: Bool;
}

contract OptMsgField {
  data: HasMsg;

  init() {
    self.data = HasMsg{
      innerMsg: null,
      flag: false
    };
  }
}
