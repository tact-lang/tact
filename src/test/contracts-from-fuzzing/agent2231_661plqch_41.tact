struct NestedOptCellSlice {
    cellOpt: Cell?;
    sliceOpt: Slice?;
}

struct OuterHold {
    nested: NestedOptCellSlice?;
}

contract OptCellSliceContract {
    foo: OuterHold;

    init() {
        self.foo = OuterHold{
            nested: null
        };
    }
}