struct OptionalNested {
    innerOpt: OptionalInner?;
}

struct OptionalInner {
    x: Int;
    y: Bool;
}

contract NestedOptionalsContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            innerOpt: null,
        };
    }
}
