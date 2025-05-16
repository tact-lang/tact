struct HasSlice {
    s: Slice;
    sOpt: Slice?;
}

contract SliceFields {
    v: HasSlice;

    init() {
        self.v = HasSlice{
            s: emptyCell().asSlice(),
            sOpt: null
        };
    }
}