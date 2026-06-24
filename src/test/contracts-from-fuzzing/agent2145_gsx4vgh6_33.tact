contract StorageTest {
    a: Int;
    tail: Slice as remaining;

    init() {
        self.a = 1;
        self.tail = emptyCell().asSlice();
    }
}