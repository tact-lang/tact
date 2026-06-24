message(10) MyMsg {
    id: Int;
}

struct WithMsg {
    count: Int;
    msg: MyMsg;
}

contract TestContract {
    st: WithMsg;

    init() {
        self.st = WithMsg{
            count: 1,
            msg: MyMsg{
                id: 99,
            },
        };
    }
}