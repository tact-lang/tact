struct RemainingTestStruct {
    a: Int;
    rest: Slice as remaining;
}

contract RemainingSlicePersistent {
    data: RemainingTestStruct;

    init() {
        self.data = RemainingTestStruct{ a:5, rest: emptyCell().asSlice() };
    }
}
