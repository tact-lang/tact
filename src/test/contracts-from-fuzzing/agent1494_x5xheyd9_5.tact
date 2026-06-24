struct SliceContainer {
    s: Slice;
}

contract SliceFieldTest {
    foo: SliceContainer;

    init() {
        self.foo = SliceContainer{ s: emptyCell().asSlice() };
    }
}
