message DirectMsg { foo: Int }

contract MsgPersistent {
    m: DirectMsg;

    init() {
        self.m = DirectMsg{foo: 1};
    }
}
