struct ContainsSliceBuilder {
    s: Slice;
    b: Builder;
}

contract SliceBuilderStorage {
    data: ContainsSliceBuilder;

    init() {
        self.data = ContainsSliceBuilder{
            s: emptyCell().asSlice(),
            b: beginCell(),
        };
    }
}