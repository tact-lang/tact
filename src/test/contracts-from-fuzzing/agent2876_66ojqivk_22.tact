struct CellFields {
    a: Cell;
    b: Builder;
    c: Slice;
    d: Cell?;
    e: Builder?;
    f: Slice?;
}

contract CellStructTest {
    data: CellFields;
    init() {
        self.data = CellFields{
            a: emptyCell(),
            b: beginCell(),
            c: emptyCell().asSlice(),
            d: null,
            e: null,
            f: null
        };
    }
}