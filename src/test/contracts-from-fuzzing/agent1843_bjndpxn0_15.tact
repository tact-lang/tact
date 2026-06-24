struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
    other: Int;
}

contract OverwriteNestedField {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{x: 1},
            other: 2
        };
        self.data.inner = Inner{x: 42};
    }
}
