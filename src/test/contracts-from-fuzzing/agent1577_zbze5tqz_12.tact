message(0x12345678) MsgType {
    a: Int;
    b: Bool?;
}

contract TestContract {
    data: MsgType;
    init() {
        self.data = MsgType{
            a: 42,
            b: null
        };
    }
}