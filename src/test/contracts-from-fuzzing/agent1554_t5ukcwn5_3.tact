struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

struct DeepOptional {
    inner: OptionalInner?;
    extra: Bool;
}

contract OptionalTest {
    s: DeepOptional;

    init() {
        self.s = DeepOptional{
            inner: null,
            extra: true,
        };
    }
}