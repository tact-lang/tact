message(11) InnerMsg {
    flag: Bool;
}

struct Middle {
    count: Int;
    msg: InnerMsg;
}

contract NestedMsgStruct {
    data: Middle;

    init() {
        self.data = Middle{
            count: 42,
            msg: InnerMsg{
                flag: true,
            },
        };
    }
}