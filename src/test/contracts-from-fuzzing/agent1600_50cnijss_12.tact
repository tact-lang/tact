message(0x1111) MsgType {
    val: Int;
}

contract TestContract {
    stored: MsgType?;

    init() {
        self.stored = null;
    }
}