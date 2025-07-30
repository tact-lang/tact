struct StructWithRemaining {
    prefix: Int as uint32;
    rest: Slice as remaining;
}

contract RemainingStructUsage {
    data: StructWithRemaining;

    init() {
        self.data = StructWithRemaining{
            prefix: 0x1234,
            rest: "hello".asComment().asSlice()
        };
    }
}