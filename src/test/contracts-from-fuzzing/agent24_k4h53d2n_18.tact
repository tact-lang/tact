struct StructWithSlice {
    sl: Slice;
    s: String;
}

contract SliceInStruct {
    field: StructWithSlice;

    init() {
        self.field = StructWithSlice{
            sl: emptyCell().asSlice(),
            s: "abc"
        };
    }
}