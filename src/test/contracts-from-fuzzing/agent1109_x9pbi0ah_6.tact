struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalNestedTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            innerOpt: null
        };
    }
}