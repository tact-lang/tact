struct OptionalNest {
    inner: Inner?;
}

struct Inner {
    field: Int?;
}

contract TestContract {
    optNested: OptionalNest;

    init() {
        self.optNested = OptionalNest{
            inner: Inner{
                field: null
            }
        };
    }
}