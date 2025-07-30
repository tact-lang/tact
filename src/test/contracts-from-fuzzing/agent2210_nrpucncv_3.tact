struct OptionalNest {
    innerOpt: Inner?;
}

struct Inner {
    flag: Bool;
    note: String?;
}

contract OptNestedTest {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            innerOpt: Inner{
                flag: false,
                note: null,
            },
        };
    }
}