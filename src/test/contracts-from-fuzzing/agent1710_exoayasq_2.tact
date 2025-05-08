struct Nested {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract Test {
    store: Nested;

    init() {
        self.store = Nested{
            inner: Inner{ x: 10, y: false },
            flag: true
        };
    }
}