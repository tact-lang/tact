struct DataWrap {
    note: String;
    flag: Bool;
}

message(55) WrapperMsg {
    info: DataWrap;
    count: Int;
}

contract DeepMixed {
    saved: WrapperMsg;

    init() {
        self.saved = WrapperMsg{
            info: DataWrap{
                note: "hi",
                flag: true
            },
            count: 5
        };
    }
}