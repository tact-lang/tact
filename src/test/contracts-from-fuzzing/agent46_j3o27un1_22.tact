message OptionalMsg {
  opt: Int?
}

contract Test {
  receive(msg: OptionalMsg) {
    if (msg.opt != null) {
      let n = msg.opt!!;
    }
  }
}