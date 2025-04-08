struct OptionalEmpty {
    maybeInt: Int?;
}

struct OuterOpt {
    inner: OptionalEmpty?;
}

contract NestedOptContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null,
        };
    }
}