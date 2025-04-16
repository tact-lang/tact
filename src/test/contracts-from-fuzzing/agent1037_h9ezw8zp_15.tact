message(22) MsgX { v: Int }

contract OptMsgDefault {
  m: MsgX? = null;

  init() {
    self.m = null;
  }
}