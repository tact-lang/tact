struct SliceStruct {
    s: Slice;
    c: Cell;
}

contract SliceInStruct {
    data: SliceStruct;

    init() {
        self.data = SliceStruct{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}