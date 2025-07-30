struct OptionalInner {
    flag: Bool;
    message: String;
}

struct OptionalOuter {
    inner: OptionalInner?;
    number: Int;
}

contract OptionalNestedTest {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{
            inner: OptionalInner{
                flag: true,
                message: "hello"
            },
            number: 100
        };
    }
}