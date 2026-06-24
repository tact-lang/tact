message SimpleMsg {
    x: Int;
    y: Bool?;
}

contract MsgPersist {
    m: SimpleMsg;
    init() {
        self.m = SimpleMsg{
            x: 123,
            y: null
        };
    }
}