struct OptionalNestInner {
    code: String?;
}

struct OptionalNestOuter {
    inner: OptionalNestInner?;
}

contract NestedOptionalsContract {
    data: OptionalNestOuter;

    init() {
        self.data = OptionalNestOuter{
            inner: null
        };
    }
}
