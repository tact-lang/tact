struct MessageWrapper {
    op: Int as uint32;
    payload: Inner;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract PayloadStore {
    data: MessageWrapper;
    init() {
        self.data = MessageWrapper{
            op: 0xAFFE,
            payload: Inner{ foo: 1, bar: true }
        };
    }
}