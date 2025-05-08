// Optional message nested deeply
message(0x11) DeepOptMsg {
  field1: Int?;
  nested: NestedMsg?;
}

message(0x12) NestedMsg {
  other: Int?;
}

contract DeepOptMsgField {
  data: DeepOptMsg;

  init() {
    self.data = DeepOptMsg{
      field1:null,
      nested: null
    };
  }
}