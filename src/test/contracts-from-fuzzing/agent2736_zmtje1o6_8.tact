struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalNestDemo {
    data: OptionalNested;

    init() {
        self.data = OptionalNested {
            inner: null
        };
    }
}