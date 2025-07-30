struct Nested {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    value: Int;
    status: Bool;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner{ value: 42, status: false },
            flag: true
        };
    }
}