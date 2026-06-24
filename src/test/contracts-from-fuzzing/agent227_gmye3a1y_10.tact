message(1) MsgA {}
message(2) MsgB {
    inner: MsgA;
}

struct ContainsMsg {
    foo: MsgB;
    num: Int;
}

contract TestContract {
    data: ContainsMsg;

    init() {
        self.data = ContainsMsg{
            foo: MsgB{ inner: MsgA{} },
            num: 123
        };
    }
}