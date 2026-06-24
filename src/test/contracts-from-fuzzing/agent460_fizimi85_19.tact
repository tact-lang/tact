message(0x10) InnerMsg {
    code: Int;
    flag: Bool;
}

struct Container {
    id: Int;
    data: InnerMsg;
}

contract NestedMsgStruct {
    storage: Container;

    init() {
        self.storage = Container{
            id: 7,
            data: InnerMsg{
                code: 123,
                flag: true,
            }
        };
    }
}