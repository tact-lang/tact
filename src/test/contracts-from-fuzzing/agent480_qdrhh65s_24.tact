message(101) TxMsg { amt: Int }

struct Wrapper {
    content: TxMsg?;
}

contract NestedOptMsgField {
    wrapOpt: Wrapper?;

    init() {
        self.wrapOpt = Wrapper{
            content: TxMsg{amt: 1000},
        };
    }
}