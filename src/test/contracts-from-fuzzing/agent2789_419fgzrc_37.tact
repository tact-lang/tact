struct WrapSlice {
    s: Slice;
}

contract SlicePersistentTest {
    slicey: WrapSlice;

    init() {
        self.slicey = WrapSlice{
            s: emptyCell().asSlice()
        };
    }
}
