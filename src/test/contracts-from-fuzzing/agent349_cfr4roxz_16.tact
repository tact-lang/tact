// Edge: optional message type as a field (should behave same as struct)
message(0x42) MsgData {
  m: Int;
  s: String;
}

contract OptionalMessageField {
  md: MsgData?;

  init() {
    self.md = MsgData{ m: 12, s: "hi" };
  }
}