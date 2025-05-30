struct SliceWrap { s: Slice; }

contract SliceStorage {
    w: SliceWrap;

    init() {
        self.w = SliceWrap{ s: emptyCell().asSlice() };
    }
}