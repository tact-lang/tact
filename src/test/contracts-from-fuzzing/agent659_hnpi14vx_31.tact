message(0x42) MsgType { x: Int; }

contract TestContract {
    m: MsgType;

    init() {
        self.m = MsgType{ x: 10 };
    }
}