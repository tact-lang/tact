struct SliceVariants {
    a: Slice;
    b: Slice?;
    c: Slice;
    d: Slice?;
}

contract TestContract {
    sv: SliceVariants;

    init() {
        self.sv = SliceVariants{
            a: emptyCell().asSlice(),
            b: null,
            c: emptyCell().asSlice(),
            d: emptyCell().asSlice(),
        };
    }
}
