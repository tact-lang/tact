struct Deep {
    nested: Nested;
}

struct Nested {
    inner: Inner;
}

struct Inner {
    number: Int;
    flag: Bool;
}

contract TestContract {
    storage: Deep;

    init() {
        self.storage = Deep{
            nested: Nested{
                inner: Inner{
                    number: 42,
                    flag: false,
                },
            },
        };
    }
}