message(1000) Msg { foo: Int }

contract ContractWithMsgField {
  stored: Msg;

  init() {
    self.stored = Msg { foo: 55 };
  }
}