struct StructWithRem {
    a: Int;
    rem: Slice as remaining;
}

contract RemainingSliceContract {
    s: StructWithRem;

    init() {
        self.s = StructWithRem{a: 1, rem: emptyCell().asSlice()};
    }
}