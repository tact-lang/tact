// test explicit default for optional nested message struct in a storage struct
message(42) MsgNested {
  n: Int;
}

struct OptMsgDefaulted {
  m: MsgNested? = null;
  v: Int = 1;
}

contract OptionalMsgDefaulted {
  val: OptMsgDefaulted;

  init() {
    self.val = OptMsgDefaulted{};
  }
}
