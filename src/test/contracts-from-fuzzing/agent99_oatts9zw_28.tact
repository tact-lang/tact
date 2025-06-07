message(0x1) EmptyMessage {}

contract StorageTest {
    data: EmptyMessage?;

    init() {
        self.data = null;
    }
}