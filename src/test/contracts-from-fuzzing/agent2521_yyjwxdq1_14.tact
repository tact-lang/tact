message MyMsg { val: Int }

struct WithMsg {
  inner: MyMsg;
  other: Int;
}

contract MsgStructPersist {
  st: WithMsg;

  init() {
    self.st = WithMsg{
      inner: MyMsg{ val: 777 },
      other: 888
    };
  }
}
