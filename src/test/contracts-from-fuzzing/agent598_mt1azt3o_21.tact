message(12345678) InnerMsg {
    info: String;
    count: Int;
}

struct Level1 {
    msg: InnerMsg;
    status: Bool;
}

struct Level0 {
    lvl1: Level1;
    label: String;
}

contract MsgOpcodeNested {
    data: Level0;

    init() {
        self.data = Level0{
            lvl1: Level1{
                msg: InnerMsg{ info: "hi", count: 9 },
                status: true
            },
            label: "ok"
        };
    }
}