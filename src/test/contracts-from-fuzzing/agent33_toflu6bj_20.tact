message(0x42) MsgType { val: Int; }

contract TestContract {
    msgData: MsgType;

    init() {
        self.msgData = MsgType{ val: 123 };
    }
}