struct InnerStruct {
    a: Int;
}

message(11) InnerMsg {
    istruct: InnerStruct;
    flag: Bool;
}

struct MidStruct {
    msg: InnerMsg;
    text: String;
}

message(22) MidMsg {
    data: MidStruct;
}

contract TestContract {
    nested: MidMsg;

    init() {
        self.nested = MidMsg{
            data: MidStruct{
                msg: InnerMsg{
                    istruct: InnerStruct{ a: 42 },
                    flag: true,
                },
                text: "deep",
            },
        };
    }
}