struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    value: Bool;
    flag: Int?;
}

contract OptNestTest {
    storage: OptionalNested;

    init() {
        self.storage = OptionalNested{
            innerOpt: Inner{
                value: false,
                flag: null,
            },
        };
    }
}
