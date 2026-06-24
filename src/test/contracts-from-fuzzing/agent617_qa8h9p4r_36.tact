message(0xDEAD) EmptyMsg {}

contract MsgOptNull {
    mopt: EmptyMsg? = null;
    init() {
      self.mopt = null;
    }
}