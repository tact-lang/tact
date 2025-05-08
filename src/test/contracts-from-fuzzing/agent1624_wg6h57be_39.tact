message(0x1234) BasicMsg {
    foo: Int;
    bar: String;
}

contract MsgInStorage {
    msgData: BasicMsg;

    init() {
        self.msgData = BasicMsg{
            foo: 7,
            bar: "data",
        };
    }
}