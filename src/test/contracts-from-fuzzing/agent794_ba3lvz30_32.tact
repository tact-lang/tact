message(0x3333) InnerMsg {
  a: Int?;
  b: Bool?;
}

struct Wrap {
  inner: InnerMsg;
}

contract MsgInsideStruct {
  data: Wrap;

  init() {
    self.data = Wrap{
      inner: InnerMsg{
        a: 42,
        b: null
      }
    };
  }
}
