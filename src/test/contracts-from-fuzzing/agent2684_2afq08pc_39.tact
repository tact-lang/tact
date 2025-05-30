struct WithSliceAndOpt {
    s: Slice;
    optI: Int?;
}

contract SliceOptField {
    f: WithSliceAndOpt;

    init() {
        self.f = WithSliceAndOpt{
            s: emptyCell().asSlice(),
            optI: null
        };
    }
}
