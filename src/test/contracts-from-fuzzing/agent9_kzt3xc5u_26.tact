struct Outer {
    inner: Inner;
}

struct Inner {
    nested: Nested;
}

struct Nested {
    x: Bool?;
}

contract OptionalChain {
    store: Outer;

    init() {
        self.store = Outer{
            inner: Inner{
                nested: Nested{
                    x: null
                }
            }
        };
    }
}