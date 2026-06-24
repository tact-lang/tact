struct CellStruct {
    foo: Cell;
    bar: Slice;
    baz: Builder;
}

contract CellStructField {
    cs: CellStruct;

    init() {
        self.cs = CellStruct{
            foo: emptyCell(),
            bar: emptyCell().asSlice(),
            baz: beginCell(),
        };
    }
}