struct StructWithSliceBuilder {
    s: Slice;
    b: Builder;
}

contract TestContract {
    x: StructWithSliceBuilder;

    init() {
        self.x = StructWithSliceBuilder{
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}