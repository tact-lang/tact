struct SliceFields {
    a: Slice;
    b: Slice;
    c: Slice;
}

contract SliceTest {
    s: SliceFields;
    init() {
        self.s = SliceFields{
            a: emptyCell().asSlice(),
            b: emptyCell().asSlice(),
            c: emptyCell().asSlice(),
        };
    }
}