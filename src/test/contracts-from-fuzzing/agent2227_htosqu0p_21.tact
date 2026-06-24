struct ContainsSliceBuilder {
    s: Slice;
    b: Builder;
}

contract PersistSlices {
    val: ContainsSliceBuilder;

    init() {
        self.val = ContainsSliceBuilder{
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}