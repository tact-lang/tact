struct ContainsSliceBuilder {
    s: Slice;
    b: Builder;
}

contract WithSlicesBuilders {
    data: ContainsSliceBuilder;
    init() {
        self.data = ContainsSliceBuilder {
            s: emptyCell().asSlice(),
            b: beginCell(),
        };
    }
}