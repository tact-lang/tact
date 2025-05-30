// Test optional nested inside optional struct
struct Inner {
    val: Int?;
}

struct Outer {
    inner: Inner?;
}

contract StorageTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null
        };
    }
}