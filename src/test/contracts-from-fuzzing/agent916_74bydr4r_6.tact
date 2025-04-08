message(0x42) MsgData {
    text: String;
    amount: Int;
}

contract Test {
    saved: MsgData;

    init() {
        self.saved = MsgData{
            text: "hello",
            amount: 100,
        };
    }
}