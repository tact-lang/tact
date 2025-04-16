struct Nested {
    inner: Inner;
}

struct Inner {
    val1: Int;
    val2: Bool;
}

contract StorageTest {
    storageField: Nested;

    init() {
        self.storageField = Nested{
            inner: Inner{
                val1: 10,
                val2: true,
            },
        };
    }
}
