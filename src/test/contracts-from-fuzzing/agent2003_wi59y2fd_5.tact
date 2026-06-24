struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{
            inner: Inner{
                x: 42,
                y: true,
            },
        };
    }
}
