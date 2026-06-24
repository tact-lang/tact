struct OptionalNestedSerialized {
    inner: Inner?;
}

struct Inner {
    small: Int as uint8;
    big: Int;
}

contract TestContract {
    data: OptionalNestedSerialized;

    init() {
        self.data = OptionalNestedSerialized{
            inner: Inner{
                small: 42,
                big: 123456789
            }
        };
    }
}
