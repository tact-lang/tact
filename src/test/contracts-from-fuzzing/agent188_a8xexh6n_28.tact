struct ContainsSlice {
    s: Slice;
}

contract SliceFieldContract {
    field: ContainsSlice;

    init() {
        self.field = ContainsSlice{ s: emptyCell().asSlice() };
    }
}