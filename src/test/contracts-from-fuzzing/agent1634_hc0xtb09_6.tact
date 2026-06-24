struct OptionalNest {
    inner: Int?;
    other: Bool;
}

contract TestContract {
    nested: OptionalNest;

    init() {
        self.nested = OptionalNest{
            inner: null,
            other: true,
        };
    }
}