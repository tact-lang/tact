struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    x: Int;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested {
            inner: null,
        };
    }
}