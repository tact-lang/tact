struct Payload {
    header: Int as uint32;
    tail: Slice as remaining;
}

contract Test {
    saved: Payload;

    init() {
        self.saved = Payload{
            header: 0xDEAD,
            tail: emptyCell().asSlice(),
        };
    }
}