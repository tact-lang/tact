struct RefStruct {
    cell: Cell;
    slice: Slice;
    builder: Builder;
}

contract RefStructWrap {
    r: RefStruct;

    init() {
        self.r = RefStruct{
            cell: emptyCell(),
            slice: emptyCell().asSlice(),
            builder: beginCell()
        };
    }
}