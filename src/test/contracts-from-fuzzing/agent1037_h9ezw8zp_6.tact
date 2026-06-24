message(0xABCDEF) Msg { x: Int }

contract OptMsgField {
  info: Msg?;

  init() {
    self.info = null;
  }
}