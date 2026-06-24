struct SliceBuilder {
    s: Slice;
    b: Builder;
}

contract ContractSB {
    data: SliceBuilder;

    init() {
        self.data = SliceBuilder{
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}