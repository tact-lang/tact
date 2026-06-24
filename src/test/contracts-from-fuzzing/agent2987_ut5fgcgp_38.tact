struct ContainsSlice {
    s: Slice;
}

contract SliceInContract {
    data: ContainsSlice;

    init() {
        self.data = ContainsSlice{ s: emptyCell().asSlice() };
    }
}
