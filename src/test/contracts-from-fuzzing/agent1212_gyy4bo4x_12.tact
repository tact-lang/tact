struct RestTail {
    a: Int;
    b: Slice as remaining;
}

contract RemainingSliceField {
    s: RestTail;

    init() {
        self.s = RestTail{
            a: 42,
            b: emptyCell().asSlice(),
        };
    }
}