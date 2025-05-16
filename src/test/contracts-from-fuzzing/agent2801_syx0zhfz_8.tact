struct MessageLike {
  opcode: Int as uint32 = 0xDEADBEEF;
  intVal: Int = 42;
  flag: Bool = true;
}

contract FakeMsgStruct {
  stored: MessageLike;

  init() {
    self.stored = MessageLike{};
  }
}