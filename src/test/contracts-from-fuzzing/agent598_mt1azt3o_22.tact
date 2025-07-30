message(0xABCDEF) RemMsg {
    text: String;
    body: Slice as remaining;
}

struct WrapMsg {
    prefix: Int as uint32;
    content: RemMsg;
}

contract RemainInMsgNested {
    container: WrapMsg;

    init() {
        self.container = WrapMsg{
            prefix: 42,
            content: RemMsg{
                text: "test",
                body: emptyCell().asSlice()
            }
        };
    }
}