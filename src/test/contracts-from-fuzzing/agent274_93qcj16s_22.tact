struct OptionalSlice {
    data: Slice?;
}

contract OptSliceTest {
    sdata: OptionalSlice;

    init() {
        self.sdata = OptionalSlice{
            data: null,
        };
    }
}