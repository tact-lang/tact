struct Payload {
    header: Int;
    data: Slice as remaining;
}

struct Envelope {
    payload: Payload;
    tag: Bool;
}

contract RemainingNested {
    env: Envelope;

    init() {
        self.env = Envelope{
            payload: Payload{
                header: 42,
                data: emptyCell().asSlice()
            },
            tag: true
        };
    }
}
