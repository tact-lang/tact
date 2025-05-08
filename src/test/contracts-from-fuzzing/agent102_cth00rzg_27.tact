struct StructWithSlice {
    data: Slice;
    text: String;
}

contract SliceStructStore {
    s: StructWithSlice;

    init() {
        self.s = StructWithSlice{
            data: emptyCell().asSlice(),
            text: "test"
        };
    }
}