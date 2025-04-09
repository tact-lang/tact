struct SliceStruct {
    bits: Slice;
    data: Int;
}

contract SliceStructTest {
    field: SliceStruct;

    init() {
        self.field = SliceStruct{
            bits: emptyCell().asSlice(),
            data: 17
        };
    }
}