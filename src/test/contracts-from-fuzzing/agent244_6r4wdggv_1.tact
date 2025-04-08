struct NestedOptionalTest {
    inner: Int?;
}

contract StorageTest {
    data: NestedOptionalTest?;

    init() {
        self.data = null;
    }
}