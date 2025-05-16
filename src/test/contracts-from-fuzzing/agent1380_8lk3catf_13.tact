message(0x42) Msg {
    info: String?;
    flag: Bool;
}

struct Holder {
    m: Msg;
    note: String;
}

contract MsgInStruct {
    data: Holder;

    init() {
        self.data = Holder{
            m: Msg{ info: null, flag: true },
            note: "done"
        };
    }
}