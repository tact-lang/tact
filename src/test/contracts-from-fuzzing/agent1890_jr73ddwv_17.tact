struct SliceStruct {
    s1: Slice;
    s2: Slice;
}

contract ContractSlices {
    slices: SliceStruct;

    init() {
        self.slices = SliceStruct{
            s1: emptyCell().asSlice(),
            s2: emptyCell().asSlice()
        };
    }
}