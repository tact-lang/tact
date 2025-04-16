struct Inner {
    a: Int as uint8;
    b: Int as int64;
}

struct Outer {
    inner: Inner?;
    val: Int as uint32;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner: null,
            val: 123456
        };
    }
}
