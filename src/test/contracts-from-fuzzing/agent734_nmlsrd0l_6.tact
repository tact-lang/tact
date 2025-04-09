struct OptNested {
    innerOpt: Inner?;
}

struct Inner {
    f: Int;
}

contract NestedOptionalsTest {
    data: OptNested;

    init() {
        self.data = OptNested{
            innerOpt: null,
        };
    }
}
