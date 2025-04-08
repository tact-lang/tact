// Optional inside message, used in persistent storage
message(0x42) MsgOpt {
  i: Int?;
}

contract MsgOptField {
  data: MsgOpt;

  init() {
    self.data = MsgOpt{i:null};
  }
}