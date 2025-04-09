struct OptionalInner {
    foo: String?;
}

struct Container {
    inner: OptionalInner?;
    bar: Bool;
}

contract OptionalNestedFieldTest {
    val: Container;

    init() {
        self.val = Container{
            inner: null,
            bar: true,
        };
    }
}