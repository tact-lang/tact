struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    x: Int;
}

struct Root {
    a: OptionalNested?;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{
            a: null,
        };
    }
}