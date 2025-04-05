message OptionalTest {
  maybe: Int?;
}

contract Test {
  receive(msg: OptionalTest) {
    if (msg.maybe != null) {
      let v = msg.maybe;
    }
  }
}