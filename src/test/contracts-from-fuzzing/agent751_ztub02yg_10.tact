struct TailPayload {
    a: Int;
    stuff: Slice as remaining;
}

contract StructWithRemaining {
    body: TailPayload;

    init() {
        self.body = TailPayload{
            a: 5,
            stuff: emptyCell().asSlice()
        };
    }
}