struct DeepOptionals {
    inner: Inner?;
}

struct Inner {
    value: Int?;
}

contract OptionalNestedTest {
    data: DeepOptionals;

    init() {
        self.data = DeepOptionals{
            inner: null,
        };
    }
}