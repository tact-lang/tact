struct CellStruct {
    c: Cell;
    s: Slice;
    b: Builder;
}

contract CellFields {
    val: CellStruct;

    init() {
        self.val = CellStruct{
            c: emptyCell(),
            s: "hi".asComment().asSlice(),
            b: beginCell(),
        };
    }
}