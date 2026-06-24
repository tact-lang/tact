struct ContainsSliceBuilder {
    s: Slice;
    b: Builder;
    c: Cell;
    str: String;
}

contract SliceBuilderTest {
    field: ContainsSliceBuilder;

    init() {
        self.field = ContainsSliceBuilder{
            s: emptyCell().asSlice(),
            b: beginCell(),
            c: emptyCell(),
            str: "hi"
        };
    }
}
