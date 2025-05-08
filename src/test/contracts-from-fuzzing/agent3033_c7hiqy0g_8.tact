struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    optnest: OptionalNested;

    init() {
        self.optnest = OptionalNested{
            inner: Inner{ foo:1, bar:false }
        };
    }
}
