message InnerMsg {}

message OuterMsg {
    nested: InnerMsg?;
}

struct Holder {
    payload: OuterMsg;
}

contract TestContract {
    stored: Holder;

    init() {
        self.stored = Holder{
            payload: OuterMsg{
                nested: null
            }
        };
    }

    receive() {}
}