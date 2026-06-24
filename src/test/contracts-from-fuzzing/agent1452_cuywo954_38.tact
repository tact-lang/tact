struct WithSlice {
    s: Slice;
    so: Slice?;
}

contract SliceFields {
    f: WithSlice;

    init() {
        let sl = emptyCell().asSlice();
        self.f = WithSlice{ s: sl, so: null };
    }
}
