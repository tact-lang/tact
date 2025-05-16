struct OptionalNest {
    nestedOpt: Inner?;
}

struct Inner {
    value: Int?;
}

contract TestContract {
    field: OptionalNest;
    init() {
        self.field = OptionalNest{
            nestedOpt: Inner{
                value: null
            }
        };
    }
}
