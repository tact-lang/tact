// test optional slice type persistence
contract TestOptSlice {
    s: Slice? = null;

    init() {
        self.s = emptyCell().asSlice();
    }
}
