message EmptyMsg {}

contract MsgOptTest {
  maybeMsg: EmptyMsg?;

  init() {
    self.maybeMsg = null;
  }
}