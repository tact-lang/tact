struct HasSlice {
    bits: Slice;
}

contract SliceTest {
    s: HasSlice;

    init() {
        self.s = HasSlice {
            bits: emptyCell().asSlice(),
        };
    }
}