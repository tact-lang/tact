struct StructWithRemaining {
    foo: Int;
    data: Slice as remaining;
}

contract RemainingSliceField {
    s: StructWithRemaining;

    init() {
        self.s = StructWithRemaining{
            foo: 123,
            data: emptyCell().asSlice()
        };
    }
}
