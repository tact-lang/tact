struct ContainsSlice {
    data: Slice;
}

contract SliceStorage {
    s: ContainsSlice;

    init() {
        self.s = ContainsSlice{
            data: emptyCell().asSlice(),
        };
    }
}