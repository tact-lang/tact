message(55) InnerMsg {
  info: String?;
}

message(66) OuterMsg {
  data: InnerMsg?;
  count: Int?;
}

contract OptMsgField {
  m: OuterMsg?;

  init() {
    self.m = OuterMsg{
      data: null,
      count: null
    };
  }
}