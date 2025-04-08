struct CellSliceOpt {
    c: Cell?;
    s: Slice?;
}

contract CellSliceOptTest {
    data: CellSliceOpt;

    init() {
        self.data = CellSliceOpt{
            c: null,
            s: null
        };
    }
}