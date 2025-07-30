struct OptionalOuter {
    nestedOpt: Inner?;
}

struct Inner {
    flag: Bool;
}

contract OptOuterTest {
    data: OptionalOuter?;
    init() {
        self.data = OptionalOuter{
            nestedOpt: Inner{
                flag: true,
            },
        };
    }
}