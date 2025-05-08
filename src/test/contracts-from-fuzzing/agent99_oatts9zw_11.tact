// Test empty optional struct at initialization
struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner?;
}

contract StorageTest {
    data: Outer;

    init() {
        self.data = Outer{inner: null};
    }
}