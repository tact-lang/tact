struct SRem {
    foo: Int;
    rest: Slice as remaining;
}

contract RemainingSlice {
    data: SRem;

    init() {
        self.data = SRem{
            foo: 42,
            rest: emptyCell().asSlice()
        };
    }
}