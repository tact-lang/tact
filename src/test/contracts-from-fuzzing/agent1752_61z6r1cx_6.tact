struct OptionalNested {
    nestedOpt: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract OptionalNestedTest {
    d: OptionalNested;

    init() {
        self.d = OptionalNested{nestedOpt: null};
    }
}