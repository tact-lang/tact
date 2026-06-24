struct OptionalNest {
    innerOpt: Inner?;
}

struct Inner {
    flag: Bool;
}

contract OptionalNestedStructTest {
    st: OptionalNest;

    init() {
        self.st = OptionalNest{
            innerOpt: Inner{ flag: true }
        };
    }
}