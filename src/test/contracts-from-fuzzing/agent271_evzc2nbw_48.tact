struct NestedSliceBuilder {
    s: Slice;
    b: Builder;
}

contract NestedSliceBuilderTest {
    v: NestedSliceBuilder;

    init() {
        self.v = NestedSliceBuilder{ s: emptyCell().asSlice(), b: beginCell() };
    }
}
