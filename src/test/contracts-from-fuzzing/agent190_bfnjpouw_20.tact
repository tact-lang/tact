message(0x11111111) MsgData {
    value: Int;
    text: String;
}

contract TestContract {
    rec: MsgData?;

    init() {
        self.rec = null;
    }
}