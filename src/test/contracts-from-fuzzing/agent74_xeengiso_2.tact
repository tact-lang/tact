struct Nested {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    x: Int;
    y: Int;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner{ x: 10, y: 20 },
            flag: false,
        };
    }
}