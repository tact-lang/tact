message(0xABCD) MsgStruct {
    id: Int as uint32;
    text: String;
}

contract MessageInStorage {
    saved: MsgStruct;

    init() {
        self.saved = MsgStruct{
            id: 123,
            text: "msg",
        };
    }
}