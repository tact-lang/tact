struct StructWithSlice {
    part: Slice;
}

contract SliceInStruct {
    field: StructWithSlice;

    init() {
        self.field = StructWithSlice{
            part: emptyCell().asSlice()
        };
    }
}