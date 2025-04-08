struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    value: Int;
}

contract Test {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: Inner{ value: 42 }
        };
    }
}