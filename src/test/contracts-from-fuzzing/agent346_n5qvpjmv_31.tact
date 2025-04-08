struct ContainsSlice {
    sl: Slice;
    optSl: Slice?;
}

contract SliceFields {
    data: ContainsSlice;
    init() {
        self.data = ContainsSlice{
            sl: emptyCell().asSlice(),
            optSl: null
        };
    }
}