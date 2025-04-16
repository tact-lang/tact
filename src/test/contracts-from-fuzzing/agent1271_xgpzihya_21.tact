message(123) MsgType {
    x: Int;
    y: Bool;
}

contract MsgAsVar {
    data: MsgType;
    init() {
        self.data = MsgType{ x: 1, y: true };
    }
    receive() {}
}