struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    val: Int?;
}

contract OptNestedTest {
    state: OptionalNested;

    init() {
        self.state = OptionalNested{innerOpt: null};
    }
}
