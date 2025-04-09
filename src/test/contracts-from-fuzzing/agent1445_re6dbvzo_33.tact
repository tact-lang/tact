struct WithSlice {
    sliceVal: Slice;
}

struct WrapSlice {
    inner: WithSlice;
}

contract StructsWithSlices {
    data: WrapSlice;

    init() {
        self.data = WrapSlice{
            inner: WithSlice{
                sliceVal: emptyCell().asSlice(),
            },
        };
    }
}