struct Inner {
    a: Int;
    b: Bool?;
}

struct Nested {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            inner: Inner{ a: 123, b: true },
            flag: false
        };
    }
}