struct WithSlices {
    s: Slice;
    cs: Slice?;
}

contract SlicesInStruct {
    data: WithSlices;

    init() {
        self.data = WithSlices{
            s: emptyCell().asSlice(),
            cs: null
        };
    }
}
