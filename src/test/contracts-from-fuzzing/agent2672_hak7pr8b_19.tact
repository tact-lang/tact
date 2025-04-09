struct MessageStub { a: Int; }

contract HoldsMsgStruct {
  msgcopy: MessageStub;

  init() {
    self.msgcopy = MessageStub { a: 42 };
  }
}