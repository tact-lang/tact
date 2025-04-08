struct Nested {
    inner: Inner;
}

struct Inner {
    value: Int;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ inner: Inner{ value: 123 } };
    }
}