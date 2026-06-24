struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    number: Int;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: null
        };
    }
}