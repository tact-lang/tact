contract SliceOptionals {
    reqSlice: Slice;
    optSlice: Slice?;

    init() {
        self.reqSlice = emptyCell().asSlice();
        self.optSlice = null;
    }
}