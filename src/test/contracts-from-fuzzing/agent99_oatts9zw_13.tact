// Test contract with no explicit defaults on nested struct fields
struct Inner {
    value: Int;
}

contract StorageTest {
    s: Inner;

    init() {
        self.s = Inner{ value: 123 };
    }
}