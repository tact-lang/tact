struct OptionalNested {
    optInner: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract OptNestedTest {
    f: OptionalNested;

    init() {
        self.f = OptionalNested{
            optInner: null,
        };
    }
}