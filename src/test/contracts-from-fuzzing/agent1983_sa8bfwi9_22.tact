message(0x1234) MsgType {
    x: Int;
}

contract MsgAsField {
    data: MsgType;

    init() {
        self.data = MsgType{ x: 42 };
    }
}