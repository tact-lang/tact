message(0xbeef) AnotherMsg {}

struct HoldingOptMsg {
  m: AnotherMsg?;
}

contract OptionMsgInsideStruct {
  field: HoldingOptMsg = HoldingOptMsg{ m: null };

  init() {
    self.field = HoldingOptMsg{ m: AnotherMsg{} };
  }
}