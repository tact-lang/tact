struct ContainsSlices {
    sl: Slice;
    optSl: Slice?;
}

contract SliceFields {
    data: ContainsSlices;
    init() {
        self.data = ContainsSlices{
            sl: beginCell().endCell().asSlice(),
            optSl: null
        };
    }
}