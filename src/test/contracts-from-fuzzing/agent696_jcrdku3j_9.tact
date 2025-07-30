struct OptionalStructInner {
    foo: Int?;
    bar: Bool?;
}

struct OptionalStructOuter {
    inner: OptionalStructInner?;
    x: Int;
}

contract TestContract {
    data: OptionalStructOuter?;

    init() {
        self.data = OptionalStructOuter{
            inner: null,
            x: 100
        };
    }
}