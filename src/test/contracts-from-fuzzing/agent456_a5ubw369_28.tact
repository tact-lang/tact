struct Example {
    prefix: Int as uint8;
    payload: Slice as remaining;
}

contract RemainingField {
    s: Example;

    init() {
        self.s = Example {
            prefix: 42,
            payload: emptyCell().asSlice()
        };
    }
}