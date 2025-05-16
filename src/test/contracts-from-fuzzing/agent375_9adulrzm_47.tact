// Check if optional slice default is handled
contract OptSliceDefault {
    s: Slice? = null;

    init() {
        self.s = emptyCell().asSlice();
    }
}
