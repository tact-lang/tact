struct Nested {
    inner: Inner;
}

struct Inner {
    foo: Int;
    bar: Bool?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner{ foo: 123, bar: null }
        };
    }
}