message EmptyMsg {}

struct WithEmptyMsg {
    m: EmptyMsg;
}

contract Test {
    s: WithEmptyMsg;

    init() {
        self.s = WithEmptyMsg{ m: EmptyMsg{} };
    }
}