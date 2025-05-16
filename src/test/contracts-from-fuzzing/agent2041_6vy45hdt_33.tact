struct SliceVariants {
    a: Slice;
    b: Slice;
}

contract SliceFields {
    s: SliceVariants;
    init() {
        self.s = SliceVariants{
            a: emptyCell().asSlice(),
            b: emptyCell().asSlice()
        };
    }
}