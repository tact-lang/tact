struct Remain {
    data: Slice as remaining;
}

contract RemainingSliceField {
    f: Remain;

    init() {
        self.f = Remain{ data: emptyCell().asSlice() };
    }
}