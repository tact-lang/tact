struct MixedTail {
    a: Int as uint32;
    b: Bool;
    rem: Slice as remaining;
}

contract Test {
    val: MixedTail;

    init() {
        self.val = MixedTail{
            a: 123,
            b: true,
            rem: emptyCell().asSlice(),
        };
    }
}