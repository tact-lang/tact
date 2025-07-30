struct SliceStruct {
    sl1: Slice;
    sl2: Slice;
}

contract Test {
    data: SliceStruct;

    init() {
        self.data = SliceStruct{
            sl1: emptyCell().asSlice(),
            sl2: emptyCell().asSlice()
        };
    }
}