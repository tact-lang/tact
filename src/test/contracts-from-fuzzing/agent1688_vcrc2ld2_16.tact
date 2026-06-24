struct MessageLike {
    opcode: Int;
    data: String;
}

struct Wrapper {
    payload: MessageLike;
    count: Int;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            payload: MessageLike{opcode: 99, data: "payload"},
            count: 5
        };
    }
}