message MyBoolMsg {
  flag: Bool
}

contract Test {
  receive(msg: MyBoolMsg) {
    if (msg.flag) {
      // do something
    }
  }
}