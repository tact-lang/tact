struct OptionalSliceWrap {
    sliceO: Slice?;
}

contract OptSliceWrapTest {
    wrapper: OptionalSliceWrap;

    init() {
        self.wrapper = OptionalSliceWrap{
            sliceO: null
        };
    }
}