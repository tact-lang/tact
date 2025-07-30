struct OptionalNested {
    nestedOpt: Inner?;
}

struct Inner {
    val: Int?;
    flag: Bool;
}

contract OptionalNestedTest {
    f: OptionalNested;

    init() {
        self.f = OptionalNested{nestedOpt: Inner{ val: null, flag: true }};
    }
}