struct NestedSlices {
    sliceField: Slice;
    cellField: Cell;
}

struct Wrapper {
    nested: NestedSlices;
    description: String;
}

contract SliceCellNestedTest {
    state: Wrapper;
    init() {
        self.state = Wrapper{
            nested: NestedSlices{
                sliceField: emptyCell().asSlice(),
                cellField: emptyCell()
            },
            description: "abc"
        };
    }
}