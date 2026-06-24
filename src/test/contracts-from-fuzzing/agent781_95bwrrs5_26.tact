message(7) InnerMsg {
    x: Int;
}

struct ContainsMsg {
    m: InnerMsg?;
    y: Int;
}

contract TestContract {
    payload: ContainsMsg;

    init() {
        self.payload = ContainsMsg{
            m: null,
            y: 5
        };
    }
}