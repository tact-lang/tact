struct OptionalNested {
    sub: Inner?;
}

struct Inner {
    x: Int;
}

contract OptionalNestedTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            sub: null
        };
    }
}