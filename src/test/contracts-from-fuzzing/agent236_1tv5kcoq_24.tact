struct SRem {
    a: Int;
    rem: Slice as remaining;
}

contract RemainingSliceInStruct {
    data: SRem;

    init() {
        self.data = SRem{a:10, rem:emptyCell().asSlice()};
    }
}