struct OptMsgWrap {
  m: EmptyMsg?;
}
message EmptyMsg {}

contract TestContract {
  optHolder: OptMsgWrap;
  init() {
    self.optHolder = OptMsgWrap{ m: null };
  }
}