struct Nested {
    inner: Inner;
}

struct Inner {
    deep: Int?;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            inner: Inner{
                deep: null,
            },
        };
    }
}
