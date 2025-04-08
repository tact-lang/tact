message(101) OptMsg {
    d: Int;
}

contract OptionalMsgStorage {
    msgData: OptMsg?;

    init() {
        self.msgData = null;
    }
}