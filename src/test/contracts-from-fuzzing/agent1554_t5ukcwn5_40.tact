struct MixedInner {
    a: Int;
    b: Bool;
}

struct OptionalOuter {
    inner: MixedInner?;
    text: String;
}

contract OptOutStructTest {
    s: OptionalOuter;

    init() {
        self.s = OptionalOuter{
            inner: null,
            text: "hello"
        };
    }
}