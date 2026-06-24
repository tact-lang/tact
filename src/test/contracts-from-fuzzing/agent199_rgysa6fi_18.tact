message(0x1234) EmptyMsg {}

struct WithEmptyMsg {
    m: EmptyMsg;
}

contract EmptyMessageStructField {
    val: WithEmptyMsg;

    init() {
        self.val = WithEmptyMsg{
            m: EmptyMsg{},
        };
    }
}
