struct Inner {
    x: Int;
    nested: Nested;
}

struct Nested {
    y: Int;
    z: Bool;
}

contract DeepNestedTest {
    inner: Inner;

    init() {
        self.inner = Inner{
            x: 1,
            nested: Nested{ y: 2, z: true }
        };
    }
}