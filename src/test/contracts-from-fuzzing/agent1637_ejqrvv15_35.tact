// optional Slice
contract OptionalSliceTest {
    s: Slice?;

    init() {
        self.s = emptyCell().asSlice();
    }
}