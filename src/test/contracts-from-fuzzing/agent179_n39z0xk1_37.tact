struct ContainsSlice {
    sl: Slice;
}

contract SliceContract {
    data: ContainsSlice;
    init() {
        self.data = ContainsSlice{ sl: emptyCell().asSlice() };
    }
}