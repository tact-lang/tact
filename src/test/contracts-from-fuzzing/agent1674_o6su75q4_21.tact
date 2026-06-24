message(101) Status {
    code: Int;
}

struct Wrapper {
    number: Int;
    state: Status;
}

contract StructHoldingMessage {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            number: 42,
            state: Status{code: 1},
        };
    }
}