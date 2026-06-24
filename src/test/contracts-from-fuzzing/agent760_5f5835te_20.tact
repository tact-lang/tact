struct Leaf {
    note: String;
}

message(21) MidMsg {
    leaf: Leaf;
    value: Int;
}

struct MidStruct {
    msg: MidMsg;
    flag: Bool;
}

message(22) TopMsg {
    mid: MidStruct;
    count: Int;
}

contract CrazyMix {
    store: TopMsg;

    init() {
        self.store = TopMsg{
            mid: MidStruct{
                msg: MidMsg{
                    leaf: Leaf{
                        note: "deep message",
                    },
                    value: 777,
                },
                flag: true,
            },
            count: 123,
        };
    }
}