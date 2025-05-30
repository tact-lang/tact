message(7) InnerMsg {
    value: Int?;
}

struct Outer {
    msg: InnerMsg;
    id: Int;
}

contract NestedMsgOpt {
    stored: Outer = Outer{msg:InnerMsg{value:null}, id:0};

    init() {
        self.stored = Outer{msg:InnerMsg{value:42}, id:1};
    }
}