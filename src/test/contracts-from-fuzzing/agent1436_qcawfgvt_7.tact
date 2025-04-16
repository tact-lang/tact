struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    value: Int;
    flag: Bool;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: null
        };
    }
}
