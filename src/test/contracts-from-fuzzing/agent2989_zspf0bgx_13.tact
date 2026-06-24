struct WithSlices {
    s1: Slice;
    s2: Slice?;
}

contract SliceHolder {
    ss: WithSlices;

    init() {
        let c = beginCell().storeUint(1, 1).endCell();
        let sl = c.asSlice();
        self.ss = WithSlices{
            s1: sl,
            s2: null
        };
    }
}
