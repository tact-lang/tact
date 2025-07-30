struct ContainsSlice {
    s: Slice;
}

contract SliceField {
    data: ContainsSlice;

    init() {
        self.data = ContainsSlice{
            s: emptyCell().asSlice()
        };
    }
}