// contract with slice and builder persistent fields
contract SliceBuilderFields {
    s: Slice;
    b: Builder;
    sOpt: Slice?;
    bOpt: Builder?;

    init() {
        let c = emptyCell();
        self.s = c.asSlice();
        self.b = beginCell();
        self.sOpt = null;
        self.bOpt = null;
    }
}