struct RefStruct {
    bigCell: Cell;
    sliceRef: Slice;
}

contract RefStore {
    s: RefStruct;

    init() {
        self.s = RefStruct {
            bigCell: emptyCell(),
            sliceRef: emptyCell().asSlice()
        };
    }
}
