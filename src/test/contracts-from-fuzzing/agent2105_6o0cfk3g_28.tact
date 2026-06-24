struct SliceFields {
    s1: Slice;
    s2: Slice;
}

contract TestContract {
    s: SliceFields;

    init() {
        self.s = SliceFields{
            s1: emptyCell().asSlice(),
            s2: emptyCell().asSlice()
        };
    }
}