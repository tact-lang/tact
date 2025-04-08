struct ContainsSlice {
    sl: Slice;
}

contract SliceStorage {
    data: ContainsSlice;
    init() {
        self.data = ContainsSlice{
            sl: emptyCell().asSlice()
        };
    }
}