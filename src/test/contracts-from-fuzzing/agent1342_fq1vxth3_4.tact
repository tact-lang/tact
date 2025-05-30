struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    value: Int;
    text: String?;
}

contract OptNest {
    state: OptionalNested;

    init() {
        self.state = OptionalNested{
            inner: Inner{
                value: 42,
                text: null
            }
        };
    }
}