struct OptionalNested {
    x: Int?;
    inner: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            x: null,
            inner: Inner{ a: 77, b: true }
        };
    }
}