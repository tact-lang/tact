message(0x9999AAAA) CustomMsg {
    foo: Int as uint16;
    bar: Int as int8;
    note: String?;
}

contract OptMsgCustomStorage {
    data: CustomMsg?;

    init() {
        self.data = CustomMsg{
            foo: 123,
            bar: -5,
            note: null
        };
    }
}