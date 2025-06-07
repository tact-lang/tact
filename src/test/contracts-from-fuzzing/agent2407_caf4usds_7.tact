struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    foo: Int;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: null,
        };
    }
}