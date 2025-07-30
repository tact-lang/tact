struct RemainingSlice {
    fixed: Int;
    rest: Slice as remaining;
}

contract TestRemainingSlice {
    data: RemainingSlice;
    init() {
        self.data = RemainingSlice {
            fixed: 42,
            rest: emptyCell().asSlice(),
        };
    }
}