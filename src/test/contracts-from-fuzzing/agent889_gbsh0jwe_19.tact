struct HasSliceAndOpt {
    s: Slice;
    o: Slice?;
}

contract PersistSliceOpt {
    v: HasSliceAndOpt;

    init() {
        self.v = HasSliceAndOpt{
            s: emptyCell().asSlice(),
            o: null,
        };
    }
}