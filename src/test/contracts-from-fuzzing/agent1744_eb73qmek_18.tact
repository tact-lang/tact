// test message with optional nested struct field + contract storage
struct SubData {
  value: Int;
}

message(0x2222) ComplexMsg {
  extra: SubData?;
  flag: Bool;
}

contract MsgOptNested {
  msg: ComplexMsg;

  init() {
    self.msg = ComplexMsg { extra: null, flag: true };
  }
}
