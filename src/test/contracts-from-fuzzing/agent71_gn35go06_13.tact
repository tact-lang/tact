struct WithSliceBuilder {
    piece: Slice;
    builder: Builder;
}

contract TestContract {
    data: WithSliceBuilder;

    init() {
        self.data = WithSliceBuilder{
            piece: emptyCell().asSlice(),
            builder: beginCell()
        };
    }
}