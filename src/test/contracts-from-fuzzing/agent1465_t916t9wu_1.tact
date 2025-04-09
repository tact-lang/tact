struct Nested {
    inner: Inner;
}

struct Inner {
    x: Int;
}

contract Test {
    storage: Nested;

    init() {
        self.storage = Nested{
            inner: Inner{ x: 42 }
        };
    }
}