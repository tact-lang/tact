struct SliceWrap {
    s: Slice;
    sOpt: Slice?;
}

contract TestContract {
    sw: SliceWrap;
    init() {
        self.sw = SliceWrap{
            s: emptyCell().asSlice(),
            sOpt: null
        };
    }
}
