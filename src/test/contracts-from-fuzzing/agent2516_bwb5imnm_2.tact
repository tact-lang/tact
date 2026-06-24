struct Nested {
    c: Int?;
    d: Inner;
}

struct Inner {
    a: Int;
    b: Int?;
}

contract TestContract {
    foo: Nested;

    init() {
        self.foo = Nested{
            c: null,
            d: Inner{
                a: 10,
                b: null,
            },
        };
    }
}