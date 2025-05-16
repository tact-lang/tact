struct WithBuilderSlice {
    b: Builder;
    s: Slice;
}

contract CompositeBuilderSliceTest {
    val: WithBuilderSlice;

    init() {
        self.val = WithBuilderSlice{
            b: beginCell(),
            s: emptyCell().asSlice()
        };
    }
}