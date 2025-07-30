struct OptionalContainer {
    inner: Inner?;
}

struct Inner {
    s: String;
}

contract OptionalInner {
    val: OptionalContainer;

    init() {
        self.val = OptionalContainer{
            inner: null,
        };
    }
}