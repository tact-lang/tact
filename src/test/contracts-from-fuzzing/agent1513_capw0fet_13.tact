struct SliceStruct {
    s1: Slice;
    s2: Slice;
}

contract SliceFields {
    field: SliceStruct;
    
    init() {
        self.field = SliceStruct{
            s1: emptyCell().asSlice(),
            s2: emptyCell().asSlice()
        };
    }
}