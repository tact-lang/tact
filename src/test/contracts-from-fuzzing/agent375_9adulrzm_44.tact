struct HasSliceAndBuilder {
    s: Slice;
    b: Builder;
}

contract TestContract {
    data: HasSliceAndBuilder;

    init() {
        self.data = HasSliceAndBuilder{
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}
