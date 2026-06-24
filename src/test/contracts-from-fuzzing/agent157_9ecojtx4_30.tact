struct WithCellSliceOptional {
    a: Cell?;
    b: Slice?;
    c: NestedCellSliceOpt?;
}

struct NestedCellSliceOpt {
    d: Cell?;
    e: Slice?;
}

contract WithCellSliceOptionalTest {
    s: WithCellSliceOptional;

    init() {
        self.s = WithCellSliceOptional{
            a: null,
            b: null,
            c: NestedCellSliceOpt{ d: emptyCell(), e: emptyCell().asSlice() }
        };
    }
}
